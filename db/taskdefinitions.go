package db

// Task
// contains task details that are fetched from the the socket interface
// and registered to the db as document
type Task struct {
	ProjectName string  // project that the task belongs to
	TaskName string     //
	Details string      // additional info regarding the task
}

// TaskTrace is the document that will be saved to the collection
type TaskTrace struct {
	SDate string // date for the task
	STime string // time stamp for the task
	T     Task   // Task details
}