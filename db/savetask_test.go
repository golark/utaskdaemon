package db_test

import (
	"github.com/golark/utaskdaemon/db"
	log "github.com/sirupsen/logrus"
	"testing"
	"time"
)

const (
	succeed = "\u2713"
	failed  = "\u2717"
)

func init() {
	log.SetLevel(log.PanicLevel) // do not log during testing below panic
}

func TestUTaskdbSaveUTask(t *testing.T) {

	taskFile := "/tmp/dummy.json"
	utaskdb := db.UTaskdb{taskFile, "", "", ""}

	t.Logf("Test:\twhen trying to save %v checking for error", utaskdb)
	err := utaskdb.SaveTaskTrace(&db.TaskTrace{SDate: time.Now().Format("02/01/2006"),
		STime: time.Now().Format("15:04"),
		T: db.Task{ProjectName: "test",
			TaskName: "task",
			Details:  "details",
		},
	})

	if err != nil {
		t.Fatalf("\t%s\tshouldn't return error %v", failed, err)
	}
	t.Logf("\t%s\tshouldn't return error%v", succeed, err)
}

func TestQueryAllTasks(t *testing.T) {

	t.Logf("Test:\twhen trying to query all tasks from db")

	_, err := db.QueryAllTasks()

	if err != nil {
		t.Fatalf("\t%s\tshouldn't return error %v", failed, err)
	}
	t.Logf("\t%s\tshouldn't return error%v", succeed, err)
}
