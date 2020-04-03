package main

import (
	"github.com/golark/utaskdaemon/cfg"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/viper"
	"os"
	"os/signal"
	"syscall"
)

// default unix socket address unless provided by config file
const (
	DefaultUnixSocketAddr string = "/tmp/utaskdaemon.sckt"
)

// init reads in viper config, sets up logrus
func init() {

	// step 1 - logrus config
	log.SetOutput(os.Stdout)     // use stdout rather than default stderr
	log.SetLevel(log.TraceLevel) // log verbosity

	// step 2 - viper options
	viper.SetConfigType("yaml")
	viper.AddConfigPath("src/github.com/golark/utaskdaemon/")
	viper.AddConfigPath("./")
	viper.SetConfigName("config.yaml")
	viper.SetDefault("UnixSocketAddr", DefaultUnixSocketAddr)

	// step 3 - read viper config
	err := viper.ReadInConfig()
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("Can't read config file, check your GOPATH - falling back to default options")
	}

}

// handle incoming signals
func signalHandler(cSig <-chan os.Signal, cDone chan<- struct{}) {

	for sig := range cSig {
		log.WithFields(log.Fields{"signal": sig}).Info("signal received")
		if sig == syscall.SIGTERM || sig == syscall.SIGKILL || sig == syscall.SIGINT {
			// signal for graceful exit
			cDone <- struct{}{}
		}
	}
}

// almighty main - hold your socks
func main() {

	// step 1 - register for signals
	chanSignal := make(chan os.Signal)
	chanDone := make(chan struct{})
	go signalHandler(chanSignal, chanDone) // spin out a handler for incoming signals
	signal.Notify(chanSignal)              // receive all signals

	// step 2 - get config
	unixSocketAddr := viper.GetString("UnixSocketAddr")

	// step 3 - start cfg main
	cfg.UtaskMain(unixSocketAddr, chanDone)
}
