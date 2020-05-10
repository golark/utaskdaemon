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

func (a muxContext) getAllTasksSorted(w http.ResponseWriter, r *http.Request) {

	log.Info("received request getAllTasks")

	w.Header().Set("Access-Control-Allow-Origin", "*") // when calling rest API through browsers this is needed

	t, err := QueryAllTasks()

	*t = SortTaskList(*t)

	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return
	}

	w.Header().Set("Content-Type", "application/json")
}

func (a muxContext) getAllTasks(w http.ResponseWriter, r *http.Request) {

	log.Info("received request getAllTasks")

	w.Header().Set("Access-Control-Allow-Origin", "*") // when calling rest API through browsers this is needed

	t, err := QueryAllTasks()

	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(t)

}


type PlotData struct {
	Labels []string
	Data   []int
}
// getProjectCounts
// returns project names along with the number of utasks registered for each project
func (a muxContext) getProjectCounts(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Access-Control-Allow-Origin", "*") // when calling rest API through browsers this is needed

	t, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return
	}
	projCount := CountUtaskPerProject(*t)

	var plotData PlotData

	for k,v := range projCount {
		plotData.Labels = append(plotData.Labels, k)
		plotData.Data = append(plotData.Data, v)
	}

	log.WithFields(log.Fields{"plotData":plotData}).Info("project count")

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(plotData)

}

// getUtaskCntPerDay
// returns utask count per day
func (a muxContext) getUtaskCntPerDay(w http.ResponseWriter, r *http.Request) {

	// when calling rest API through browsers this is needed
	w.Header().Set("Access-Control-Allow-Origin", "*")

	t, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return
	}
	utaskCntPerDay, _ := CountNumUtasksPerDay(*t)

	var plotData PlotData

	for k,v := range utaskCntPerDay {
		plotData.Labels = append(plotData.Labels, k)
		plotData.Data = append(plotData.Data, v)
	}

	log.WithFields(log.Fields{"plotData":plotData}).Info("daily utask count")

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(plotData)

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
	router.HandleFunc("/gettaskssorted", muxContext{utaskdb: &uTaskdb, c:c}.getAllTasksSorted).Methods("GET")
	router.HandleFunc("/deletealltasks", muxContext{utaskdb: &uTaskdb, c:c}.deleteAllTasks).Methods("GET")
	router.HandleFunc("/getprojectcounts", muxContext{utaskdb: &uTaskdb, c:c}.getProjectCounts).Methods("GET")
	router.HandleFunc("/getdailyutaskcount", muxContext{utaskdb: &uTaskdb, c:c}.getUtaskCntPerDay).Methods("GET")

	log.Info("starting mongodb mux")
	http.ListenAndServe(port, router)

}
