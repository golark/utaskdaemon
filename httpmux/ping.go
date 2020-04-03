package httpmux

import (
	log "github.com/sirupsen/logrus"
	"net/http"
)

// Ping logs incoming pings
// mainly used for testing & sanity checking purposes
func Ping(w http.ResponseWriter, r *http.Request) {

	// step 1 - log incoming ping
	log.WithFields(log.Fields{"uri": r.URL.String(), "method": r.Method, "remoteAddr": r.RemoteAddr}).Info("ping received - replying")

	// step 2 - reply back
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("ping command acknowledged"))

}
