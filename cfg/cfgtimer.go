package cfg

import (
	"github.com/golark/utaskdaemon/db"
	"github.com/golark/utaskdaemon/httpmux"
	log "github.com/sirupsen/logrus"
	errors "golang.org/x/xerrors"
	"os/exec"
	"time"
)

// SingleShot for requests to start one time utask
type SingleShot struct {
	T       time.Duration // length of the utask
	CsvFile string        // csv file for output
	Name    string        // name of the task
	Details string        // task notes
}

// UTaskTimer intended as a go routine that receives a time duration for cfg over the channel
// upon receiving the time, it starts a timer
func UTaskTimer(c chan httpmux.SingleShotReq, chanDone <-chan struct{}, cDB chan <- db.TaskTrace) {

	for {
		select {
		case sShot := <-c:
			log.WithFields(log.Fields{"SingleShot": sShot}).Info("starting single show cfg")
			go singleShotUTask(sShot, cDB)
		case <-chanDone: // we need to return
			log.Trace("gracefully stopping utasktimer")
			return

		}
	}
}

// singleShotUTask performs a single shot cfg notifying user to focus, refocus and rest
// single argument time duration must be larger than 1 minute
// returns error if the time duration is shorter than the minimum limit as above
func singleShotUTask(s httpmux.SingleShotReq, cDB chan <- db.TaskTrace) error {

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

	cmd = exec.Command("notify-send", "-u", "critical", "-t", "0", "time is up", "take a break")
	cmd.Run()

	// time stamp the task and send over channel to save
	cDB <- db.TaskTrace{SDate: time.Now().Format("02/01/2006"),
		STime:time.Now().Format("15:04"),
		T:db.Task{ProjectName:s.ProjName, TaskName:s.TaskName, Details:s.Details,}, }

	return nil
}
