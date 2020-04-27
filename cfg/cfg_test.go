package cfg

import (
	"github.com/golark/utaskdaemon/db"
	"testing"

	"github.com/golark/utaskdaemon/httpmux"
)

// attempt to start single shot cfg with wrong parameters
func TestSingleShotUTask(t *testing.T) {

	ch := make(chan db.TaskTrace)

	// start single cfg with time out of bounds
	err := singleShotUTask(
		httpmux.SingleShotReq{
			T:       0, // time is passed as 0 - this should return an error
			ProjName: "",
			TaskName:    "",
			Details: "",
		}, ch)

	// expecting error
	if err == nil {
		t.Errorf("Expected error at 0 Minute singleShotUtask")
	}

}

// setup a dummy unix socket
func TestUnixSocketSetup(t *testing.T) {

	_, err := UnixSocketSetup("/tmp/test.sckt")

	if err != nil {
		t.Errorf("Error during unix socket setup")
	}
}
