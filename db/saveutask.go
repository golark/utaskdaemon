package db

import (
	"encoding/json"
	db "github.com/golark/mongodb"
	log "github.com/sirupsen/logrus"
	"io/ioutil"
	"os"
	"time"
)

// UTaskdb contains csv file or db details for saving utasks
type UTaskdb struct {
	TaskFile string // file to save the tasks
	MongoURI string
	MongoDatabase string
	MongoCollection string
}

type TaskTrace struct {
	tDate string
	sTime string
	name string
	details string
}

// saveToMongo
// start a new mongodb connection, save the document and terminate connection
func (utaskdb *UTaskdb) saveToMongo(t TaskTrace) error {

	// step 1 -  connect
	dbConn, err := db.NewMongoConn(utaskdb.MongoURI, utaskdb.MongoDatabase, utaskdb.MongoCollection)
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

// SaveUTask is the main entry point for saving cfg details to db or csv
// return errors if any occurs while saving the task details
// tries to save to both db and csv
func (utaskdb *UTaskdb) SaveUTask(name string, details string) error {

	t := TaskTrace{time.Now().Format("02/01/2006"),
		time.Now().Format("15:04"),
		name,
		details,
	}

	// step 1 - try to save to db
	if utaskdb.MongoURI != "" {
		err := utaskdb.saveToMongo(t)
		if err != nil {
			log.WithFields(log.Fields{"err":err}).Info("couldn't save to mongo db")
		}

	} else {
		log.Trace("skipping mongodb as URI is not provided")
	}

	// step 2 - save to csv
	err := marshalAndSave(utaskdb.TaskFile, t)
	if err != nil {
		return err
	}

	return err
}

func marshalAndSave(filename string, newTask TaskTrace) error {

	var tasks []TaskTrace

	// read previous entries
	prevTasks, err := readTasksFromFile(filename)

	if err != nil && !os.IsNotExist(err) {
		return err
	}

	// add previous and new task
	if prevTasks != nil {
		tasks = append(tasks, prevTasks...)
	}
	tasks = append(tasks, newTask)

	m, err := json.MarshalIndent(tasks, "", "   ")
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant marshal")
		return err
	}

	err = ioutil.WriteFile(filename, m, 0664)
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("can not write to file")
		return err
	}

	return nil
}

func readTasksFromFile(fileName string) ([]TaskTrace, error) {

	// step 1 - read file
	r, err := ioutil.ReadFile(fileName)
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant read file")
		return nil, err
	}

	// step 2 - unmarshal data
	var t []TaskTrace
	json.Unmarshal(r, &t)

	return t, nil
}

/*
// write to csv file and flush, reports any errors
func csvWriteAndFlush(w *csv.Writer, entry []string) error {

	// step 1 - writer nil check
	if w == nil {
		return errors.New("writer is nil")
	}

	// step 2 - write entry to the file
	err := w.Write(entry)
	if err != nil { // only log write errors but dont return
		log.WithFields(log.Fields{"err": err}).Error("error occurred while writing to file")
	}

	// step 3 - leave it as you find it
	w.Flush()

	// step 4 - check for errors
	if err = w.Error(); err != nil {
		log.WithFields(log.Fields{"err": err}).Error("write error occurred")
		return errors.New("error during writing")
	}

	return err
}

// saveToCsv saves the given entry to the csv file
// from the utaskdb
// returns error if any occurs while saving the entry to csv file
func (utaskdb *UTaskdb) saveToCsv(entry []string) (err error) {

	err = nil

	// step 1 - sanity check CsvFile location
	if utaskdb.CsvFile == "" {
		err = errors.New("csv file location is empty")
		log.Error(err)
		return
	}

	// step 2 - check if csv file exists
	_, err = os.Stat(utaskdb.CsvFile)
	bNewFile := os.IsNotExist(err)

	// step 3- open csv file, - create a new csv file unless exists
	f, err := os.OpenFile(utaskdb.CsvFile, os.O_CREATE|os.O_RDWR|os.O_APPEND, os.ModePerm)
	if err != nil {
		log.WithFields(log.Fields{"err": err, "file": utaskdb.CsvFile}).Error("can not open file")
		return
	}
	w := csv.NewWriter(f)

	// step 4 - defer file close
	// modifies named return parameter err of the wrapper function
	defer func() {
		err = f.Close()
		if err != nil {
			log.WithFields(log.Fields{"err": err}).Error("errored while closing csv file")
		}
	}()

	// step 5 - write to the csv file
	if bNewFile { // add a header if this is the first time we are writing
		header := []string{"date", "time", "task name", "notes"}
		if err = csvWriteAndFlush(w, header); err != nil {
			return
		}
	}
	if err = csvWriteAndFlush(w, entry); err != nil {
		return
	}

	return
}
*/
