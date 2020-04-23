package db

import (
	"encoding/json"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"time"
)

const (
	port = ":8091"
)

// muxContext
// pass context to mux handlers
type muxContext struct {
	utaskdb *UTaskdb
	c    chan <- TaskTrace
}

// addTask
// insert a new task to the db
func (mCtx muxContext) addTask(w http.ResponseWriter, r *http.Request) {

	log.Trace("received request to add task")

	// this is required when the request come from browser
	w.Header().Set("Content-Type", "application/json")

	// decode the body into a new Task
	t := Task{}
	_ = json.NewDecoder(r.Body).Decode(&t)

	log.WithFields(log.Fields{"task": t}).Trace("received new task")

	// create a task trace from the received task and save
	mCtx.c <- TaskTrace{time.Now().Format("02/01/2006"),
		time.Now().Format("15:04"),
		t,
	}

}

func (a muxContext) getAllTasks(w http.ResponseWriter, r *http.Request) {

	log.Info("received request getAllTasks")

	w.Header().Set("Access-Control-Allow-Origin", "*") // when calling rest API through browsers this is needed

	t, err := GetTasks()

	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(t)

}

func (a muxContext) deleteAllTasks(w http.ResponseWriter, r *http.Request) {

	log.Info("received request deleteTask")
	DeleteAllTasks()
}

func StartMux(c chan <- TaskTrace) {

	URI := "mongodb://localhost:27017"
	database := "tasks"
	collection := "taskCollection"

	uTaskdb := UTaskdb{MongoURI: URI, MongoDatabase: database, MongoCollection: collection}

	router := mux.NewRouter()

	router.HandleFunc("/addtask", muxContext{utaskdb: &uTaskdb, c:c}.addTask).Methods("POST")
	router.HandleFunc("/gettasks", muxContext{utaskdb: &uTaskdb, c:c}.getAllTasks).Methods("GET")
	router.HandleFunc("/deletealltasks", muxContext{utaskdb: &uTaskdb, c:c}.deleteAllTasks).Methods("GET")

	log.Info("starting mongodb mux")
	http.ListenAndServe(port, router)

}