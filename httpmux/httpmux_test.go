package httpmux

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestPing(t *testing.T) {

	// a simple request for testing purposes
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatal(err)
	}

	// recorder for the response
	r := httptest.NewRecorder()

	// unit under test
	handler := http.HandlerFunc(Ping)
	handler.ServeHTTP(r, req)

	// check the result
	if http.StatusOK != r.Code {
		t.Errorf("Didn't receive http StatusOK %v", r.Code)
	}

}

func TestStartTimer(t *testing.T) {

	// a simple request for testing purposes
	// not passing rest api parameter time for test purposes
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatal(err)
	}

	// recorder for the response
	r := httptest.NewRecorder()

	// unit under test
	cSingleShot := make(chan SingleShotReq)

	httpContext := HttpContext{20, cSingleShot}
	handler := http.HandlerFunc(httpContext.StartTimer)
	go handler.ServeHTTP(r, req)

	// check that the time is the default
	singleShoReq := <- cSingleShot
	if singleShoReq.T != 20 {
		t.Errorf("Didn't receveive expected time %v", singleShoReq.T)
	}
	// check the result
	if http.StatusOK != r.Code {
		t.Errorf("Didn't receive http StatusOK %v", r.Code)
	}

}
