package db

import (
	"encoding/csv"
	log "github.com/sirupsen/logrus"
	errors "golang.org/x/xerrors"
	"os"
	"time"
)

// UTaskdb contains csv file or db details for saving utasks
type UTaskdb struct {
	CsvFile string // csv file to save the task
}

// SaveUTask is the main entry point for saving cfg details to db or csv
// return errors if any occurs while saving the task details
func (utaskdb *UTaskdb) SaveUTask(name string, details string) error {

	// try to save to db
	// @TODO: implement db connection and save

	// save to csv
	entry := []string{time.Now().Format("02/01/2006"),
		time.Now().Format("15:04"),
		name,
		details,
	}
	log.WithFields(log.Fields{"entry": entry, "csvfile": utaskdb.CsvFile}).Info("save to csv file")
	err := utaskdb.saveToCsv(entry)

	return err
}

// write to csv file and flush, reports any errors
func writeAndFlush(w *csv.Writer, entry []string) error {

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
		if err = writeAndFlush(w, header); err != nil {
			return
		}
	}
	if err = writeAndFlush(w, entry); err != nil {
		return
	}

	return
}
