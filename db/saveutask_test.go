package db

import (
	"testing"
)

func TestUTaskdb_SaveUTask(t *testing.T) {

	testCsvFile := "/tmp/dummy.csv"
	db := UTaskdb{testCsvFile, "", "", ""}

	// step 1 - make an entry to the csv file and check for errors
	err := db.SaveUTask("some name", "some details")
	if err != nil {
		t.Error(err)
	}

}
