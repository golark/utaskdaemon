package db

import (
	"testing"
	"time"
)

func TestUTaskdb_SaveUTask(t *testing.T) {

	taskFile := "/tmp/dummy.json"
	db := UTaskdb{taskFile, "", "", ""}

	// step 1 - try to save to file and check for errors
	err := db.SaveTaskTrace(&TaskTrace{time.Now().Format("02/01/2006"),
		time.Now().Format("15:04"),
		Task{ "proj",
			"task",
			"details",
		},
	})
	if err != nil {
		t.Error(err)
	}
}
