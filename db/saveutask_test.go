package db

import (
	"testing"
)

func TestUTaskdb_SaveUTask(t *testing.T) {

	taskFile := "/tmp/dummy.json"
	db := UTaskdb{taskFile, "", "", ""}

	// step 1 - make an entry to the csv file and check for errors
	err := db.SaveUTask("some name", "some details")
	if err != nil {
		t.Error(err)
	}

}
