package db

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

// SortTaskList
// sort task list with project name
func SortTaskList(taskTraces []TaskTrace) []TaskTrace {

	var projList []string
	var sortedList []TaskTrace

	// step 1 - make a list of unique project names
	for _, trace := range taskTraces {
		if false == containsEntry(projList, trace.T.ProjectName) {
			projList = append(projList, trace.T.ProjectName)
		}
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
