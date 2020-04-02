package cfg

import (
	log "github.com/sirupsen/logrus"
	errors "golang.org/x/xerrors"
	"os"
	"os/exec"
	"time"
	"github.com/golark/utaskdaemon/db"
	"github.com/golark/utaskdaemon/httpmux"
)

type SingleShot struct {
	T time.Duration
	CsvFile string
	Name string
	Details string
}

// UTaskTimer intended as a go routine that receives a time duration for cfg over the channel
// upon receiving the time, it starts a timer
func UTaskTimer(c chan httpmux.SingleShotReq, chanDone <- chan struct{}) {

	for {
		select {
			case sShot:=<-c:
				log.WithFields(log.Fields{ "SingleShot": sShot}).Info("starting single show cfg")
				go singleShotUTask(sShot)
			case <- chanDone: // we need to return
				log.Trace("gracefully stopping utasktimer")
				return

		}
	}
}

// singleShotUTask performs a single shot cfg notifying user to focus, refocus and rest
//
// single argument time duration must be larger than 1 minute
// returns error if the time duration is shorter than the minimum limit as above
func singleShotUTask(s httpmux.SingleShotReq) error {

	if s.T <= 0 {
		return errors.New("singleShotUTask duration is too low")
	}

	cmd := exec.Command("notify-send", "time to focus", "one min silence")
	cmd.Run()

	// first mediate/contemplate for 1 minute
	timer := time.NewTimer(time.Minute * 1)
	<-timer.C

	cmd = exec.Command("notify-send", "time to refocus", "have a good time")
	cmd.Run()

	timer = time.NewTimer(time.Minute * s.T)
	<-timer.C

	cmd = exec.Command("notify-send", "-u", "critical", "-t" , "0", "time is up", "take a break")
	cmd.Run()

	// save cfg
	homeDir, err := os.UserHomeDir()
	var csvFile string
	if err != nil {
		log.WithFields(log.Fields{"err" : err}).Error("cant get user home directory")
		csvFile = "/opt/cfg.csv"
	} else {
		csvFile = homeDir + "/Documents/cfg.csv"
	}

	db := db.UTaskdb{csvFile}
	err = db.SaveUTask(s.Name, s.Details)
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("cant save cfg")
		return err
	}

	return nil
}
