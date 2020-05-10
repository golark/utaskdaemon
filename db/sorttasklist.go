package db

import (
	log "github.com/sirupsen/logrus"
	"time"
)

// containsEntry
// checks if the given entry is contained inside string slice l
func containsEntry(l []string, entry string) bool {

	for _, s := range l {
		if entry == s {
			return true
		}
	}
	return false
}

// getUniqueProjects
// get unique project entries in the task trace
func getUniqueProjects(taskTraces []TaskTrace) []string {

	var projList []string

	// step 1 - make a list of unique project names
	for _, trace := range taskTraces {
		if false == containsEntry(projList, trace.T.ProjectName) {
			projList = append(projList, trace.T.ProjectName)
		}
	}

	return projList
}

// SortTaskList
// sort task list with project name
func SortTaskList(taskTraces []TaskTrace) []TaskTrace {

	var sortedList []TaskTrace

	// step 1 - make a list of unique project names
	projList := getUniqueProjects(taskTraces)
	if projList == nil {
		return nil
	}

	// step 2 - sort items according to project name
	for _, proj := range projList {
		for _, trace := range taskTraces {

			if proj == trace.T.ProjectName {
				sortedList = append(sortedList, trace)
			}
		}
	}

	return sortedList
}

// CountNumUtasksPerDay
// count the number of utasks registered per date in date order old -> new
func CountNumUtasksPerDay(taskTraces []TaskTrace) (map[string]int, []string) {


	if taskTraces == nil {
		return nil, nil
	}

	// step 1 - get unique dates
	var uniqueDates []string
	for _, t := range taskTraces {

		found := false
		for _, d := range uniqueDates {
			if d == t.SDate {
				found = true
				break
			}
		}
		if found == false {
			uniqueDates = append(uniqueDates, t.SDate)
		}
	}

	// step 2 - convert to time
	var uniqueTimes []time.Time
	layout := "02/01/2006"

	for _, s := range uniqueDates {
		t, err := time.Parse(layout, s)

		if err != nil {
			log.WithFields(log.Fields{"err":err, "date string": s}).Error("cant parse date string")
			continue
		}

		uniqueTimes = append(uniqueTimes, t)
	}
	if len(uniqueTimes) == 0 { //make sure we have valid time entries
		log.Error("no unique time entries extracted, bailing")
		return nil, nil
	}

	// step 3 - get first and last dates
	firstDate := uniqueTimes[0]
	lastDate :=  uniqueTimes[0]
	for _, t := range uniqueTimes {
		if t.Before(firstDate) {
			firstDate = t
		}
		if t.After(lastDate) {
			lastDate = t
		}
	}

	// step 4 - generate map from first to last date
	// mapping [ date ] = num utasks
	countMap := make(map[string]int)
	var orderedKeys []string
	for d := firstDate; d.Before(lastDate); d=d.AddDate(0,0,1) {

		key := d.Format(layout)
		orderedKeys = append(orderedKeys, key)
		countMap[key] = 0
		log.WithFields(log.Fields{"d":d}).Info("")
	}

	// step 5 - count
	for d, _ := range countMap {
		for _, t := range taskTraces {
			if d == t.SDate {
				countMap[d]++
			}
		}
	}

	log.WithFields(log.Fields{"count":countMap}).Info("count")

	return countMap, orderedKeys
}

// CountUtaskPerProject
// count the number of entries per project
func CountUtaskPerProject(taskTraces []TaskTrace) map[string]int {

	countMap := make(map[string]int)

	// step 1 - make a list of unique project names
	projList := getUniqueProjects(taskTraces)
	if projList == nil {
		return nil
	}

	// step 2 - get the counts
	for _, proj := range projList {

		count := 0
		for _, trace := range taskTraces {
			if proj == trace.T.ProjectName {
				count++
			}
		}

		countMap[proj] = count

	}

	return countMap

}
