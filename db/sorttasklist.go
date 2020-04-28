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

func CountProjects(taskTraces []TaskTrace) map[string]int {

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
