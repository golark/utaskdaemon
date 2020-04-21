package db

import (
	"encoding/json"
	"github.com/golark/mongodb"
	log "github.com/sirupsen/logrus"
	"io/ioutil"
	"os"
)

// UTaskdb contains csv file or db details for saving utasks
type UTaskdb struct {
	TaskFile string // file to save the tasks
	MongoURI string
	MongoDatabase string
	MongoCollection string
}

const (
	fileName   = "/tmp/tasks.json"
	URI        = "mongodb://localhost:27017"
	Database   = "tasks"

	Collection = "taskCollection"
)

func SaveTask(c <- chan TaskTrace) {

	for t := range c {
		log.WithFields(log.Fields{"t":t}).Info("received a new task trace to save")

		// save the task
		utaskdb := UTaskdb{ fileName, URI, Database, Collection}
		utaskdb.SaveTaskTrace(&t)
	}
}

// SaveTaskTrace is the main entry point for saving cfg details to db or text file
// return errors if any occurs while saving the task details
// tries to save to both db and text
func (utaskdb *UTaskdb) SaveTaskTrace(t *TaskTrace) error {

	// step 1 - try to save to db
	if utaskdb.MongoURI != "" {
		err := utaskdb.saveToDB(t)
		if err != nil {
			log.WithFields(log.Fields{"err": err}).Info("couldn'T save to mongo db")
		}

	} else {
		log.Trace("skipping mongodb as URI is not provided")
	}

	// step 2 - save to file as a secondary
	if utaskdb.TaskFile != "" {
		err := saveToFile(utaskdb.TaskFile, t)
		if err != nil {
			return err
		}
	}

	return nil
}

// saveToDB
// start a new mongodb connection, save the document and terminate connection
func (utaskdb *UTaskdb) saveToDB(t *TaskTrace) error {

	// step 1 -  connect
	dbConn, err := mongodb.NewMongoConn(utaskdb.MongoURI, utaskdb.MongoDatabase, utaskdb.MongoCollection)
	if err != nil {
		log.WithFields(log.Fields{"err":err, "URI":utaskdb.MongoURI}).Error("cant connect to mongodb")
		return err
	}
	defer dbConn.Disconnect()

	// step 2 - save to db
	err = dbConn.InsertNewDocument(t)
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Info("error while inserting document")
		return err
	}

	return nil
}

// saveToFile
// marshal TaskTrace and save to given file
func saveToFile(filename string, newTask *TaskTrace) error {

	var t []TaskTrace

	// read previous entries
	prevTasks, err := readFileAndUnmarshal(filename)

	if err != nil && !os.IsNotExist(err) {
		return err
	}

	// add previous and new task
	if prevTasks != nil {
		t = append(t, prevTasks...)
	}
	t = append(t, *newTask)

	
	// marshal all 
	m, err := json.MarshalIndent(t, "", "   ")
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant marshal")
		return err
	}

	// write the marshalled to file
	err = ioutil.WriteFile(filename, m, 0664)
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("can not write to file")
		return err
	}

	return nil
}

// readFileAndUnmarshal
// read from the given file and and return unmarshal TaskTrace contents
func readFileAndUnmarshal(fileName string) ([]TaskTrace, error) {

	// step 1 - read file
	r, err := ioutil.ReadFile(fileName)
	if err != nil && !os.IsNotExist(err) {
		log.WithFields(log.Fields{"err":err}).Error("cant read file")
		return nil, err
	}

	// step 2 - unmarshal data into task trace
	var t []TaskTrace
	json.Unmarshal(r, &t)

	return t, nil
}

// GetTasks
// return all task traces by first searching in db and then the file
func GetTasks() (*[]TaskTrace, error) {

	// check if the db can be reached
	// step 1 -  connect
	dbConn, err := mongodb.NewMongoConn(URI, Database, Collection)
	if err != nil {
		log.WithFields(log.Fields{"err":err, "URI":URI}).Error("cant connect to mongodb")
		return nil, err

	}
	defer dbConn.Disconnect()

	// get tasks from the db
	var rawData []map[string]interface{}

	rawData, err = dbConn.GetAllDocuments()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("error while getting documents")
		return nil, err
	}
	log.WithFields(log.Fields{"rawdata":rawData}).Info("received documents")

	// parse
	var tSlc []TaskTrace
	for _, r:= range rawData {
		t := TaskTrace{}
		jStr, _ := json.Marshal(r)
		json.Unmarshal(jStr, &t)

		tSlc = append(tSlc, t)
	}

	return &tSlc, nil
}

