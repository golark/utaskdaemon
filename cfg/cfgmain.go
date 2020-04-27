// Package cfg sets up a unix socket where it accepts requests overu
// for starting, stopping utasks
package cfg

import (
	"context"
	"github.com/golark/utaskdaemon/db"
	"github.com/golark/utaskdaemon/httpmux"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net"
	"net/http"
	"os"
	"time"
)

// UnixSocketSetup creates a unix socket & starts a listener at the unix socket
// returns the listener and nil
func UnixSocketSetup(unixSocketAddr string) (net.Listener, error) {

	// step 1 - remove previous socket
	err := os.RemoveAll(unixSocketAddr)
	if err != nil {
		// we cant remove old socket - log but continue execution
		log.WithFields(log.Fields{"unixSocketAddr": unixSocketAddr, "err": err}).Warn("this can cause problems when trying to communicate over this socket")
	}

	// step 2 - listen unix port
	listener, err := net.Listen("unix", unixSocketAddr) // listen on unix socket
	if err != nil {
		// if we can't communicate, we shall die
		log.WithFields(log.Fields{"unixSocketAddr": unixSocketAddr, "err": err}).Fatal("cant listen on socket - exiting")
		return nil, err
	}

	return listener, nil
}

// UtaskMain stars a listener at the given unix socket address serving cfg http requests
// takes in a unix socket address
func UtaskMain(unixSocketAddr string, cDone <-chan struct{}) error {

	// step 1 - unix socket setup
	listener, err := UnixSocketSetup(unixSocketAddr)
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Warn("error during Unix Socket Setup")
		return err
	}

	// step 2 - spin utask_timer
	cSingleShot := make(chan httpmux.SingleShotReq)
	cStopTimer := make(chan struct{})
	cTaskdB := make(chan db.TaskTrace)
	go UTaskTimer(cSingleShot, cStopTimer, cTaskdB)

	// step 3 - setup http mux
	router := mux.NewRouter()
	router.HandleFunc("/ping", httpmux.Ping).Methods("GET")
	router.HandleFunc("/start/{time}/{projname}/{taskname}/{tasknote}", httpmux.HttpContext{time.Duration(1), cSingleShot}.StartTimer).Methods("GET")

	// step 4 - http baby
	srv := &http.Server{Handler: router}
	go func() {
		if err := srv.Serve(listener); err != nil {
			log.WithFields(log.Fields{"err": err}).Error("error occurred when serving http")
		}
	}()
	log.Info("listening for connections")

	// step 5 - start mongodb interface
	go db.SaveTask(cTaskdB)
	go db.StartMux(cTaskdB)

	// step 6 - handle shutdown requests
	<-cDone // wait for signal to shutdown

	// if we are here, we need to cleanup gracefully - like a pretty little maid
	cStopTimer <- struct{}{} // first stop UtaskTimer

	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()

	// shutdown the server gracefully
	if err := srv.Shutdown(ctx); err != nil {
		log.WithFields(log.Fields{"err": err}).Error("http server shutdown failed")
		return err
	}

	// we made it - nice
	log.Info("http server exited without issues")

	return nil
}
