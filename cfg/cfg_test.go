package cfg

import (
	"testing"
	"utaskdaemon/utask"

	"github.com/golark/utaskdaemon/httpmux"
)

// attempt to start single shot cfg with wrong parameters
func TestSingleShotUTask(t *testing.T) {

	// start single cfg with time out of bounds
	err := singleShotUTask(
		httpmux.SingleShotReq{
			T:       0, // time is passed as 0 - this should return an error
			Name:    "",
			Details: "",
		})

	// expecting error
	if err == nil {
		t.Errorf("Expected error at 0 Minute singleShotUtask")
	}

}

// setup a dummy unix socket
func TestUnixSocketSetup(t *testing.T) {

	_, err := utask.UnixSocketSetup("/tmp/test.sckt")

	if err != nil {
		t.Errorf("Error during unix socket setup")
	}

}
