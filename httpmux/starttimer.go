package httpmux

import (
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
	"time"
)

// HttpContext for passing the context from external packages
type HttpContext struct {
	DefaultTime time.Duration
	CSingleShot chan SingleShotReq
}

// single shot request from cli
type SingleShotReq struct {
	T time.Duration
	Name string
	Details string
}

// StartTimer http handler that starts single shot cfg
func (httpCtx HttpContext) StartTimer(w http.ResponseWriter, r *http.Request) {

	// step 1 - get variables from request
	params := mux.Vars(r)

	// step 2 - try to extract variables
	taskName := params["taskname"]
	taskNote := params["tasknote"]

	log.WithFields(log.Fields{"params": params}).Trace("new request to start timer")

	// get time duration parameter and convert to int
	tInt, err := strconv.Atoi(params["time"])
	tTime := time.Duration(tInt)
	// if cant extract the time from request, use default time
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Warn("Error during converting time received over rest - using to default time")
		tTime = httpCtx.DefaultTime
	}

	// step 3 - send the time received over the channel
	httpCtx.CSingleShot <- SingleShotReq{tTime, taskName, taskNote}

}
