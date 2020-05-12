package db

import (
	"context"
	"errors"
	"github.com/golark/utaskdaemon/db/protother"
	log "github.com/sirupsen/logrus"
	gRPC "google.golang.org/grpc"
	"net"
)

//go:generate protoc protother.proto -I=./protother --go_out=plugins=grpc:./protother
//go:generate protoc protother.proto -I=./protother --dart_out=grpc:./protother

const (
	GrpcPort = ":9070"
)

type UTaskServer struct {}

func (u UTaskServer) Ping(ctx context.Context, req *protother.PingRequest) (*protother.PingReply, error) {
	log.WithFields(log.Fields{"req":req.Message}).Info("ping request received")

	reply := protother.PingReply{Message:"Ping Ack"}

	return &reply, nil
}

// GetTasks
// streams all tasks in db back to the client
func (u UTaskServer) GetTasks(req *protother.TaskRequest, strm protother.Tasks_GetTasksServer) error{

	tasks, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Error("can not get tasks")
		return err
	}

	// stream
	for _, t := range *tasks {
		utask := protother.UTask{Project:t.T.ProjectName, TaskMane:t.T.TaskName, Date:t.SDate}
		if err := strm.Send(&utask); err != nil {
			log.WithFields(log.Fields{"err": err}).Error("error streaming")
		}
	}

	return nil
}


func (u UTaskServer) GetPlot(req *protother.PlotRequest, stream protother.Tasks_GetPlotServer) error {

	ColorCodes := []string{"#fb7e7e", "#b6fb7e", "#7ea4fb", "#937efb", "#fbae7e", "#ec7efb", "#7efbe0", "#40ff1f", "#fbec7e", "#1fffe5", "#fff81f", "#ff1f1f", "#1f40ff", "#9ba9fd",
		"#88c20c", "#eb33db", "#fedd20", "#d8eb33", "#eb3933", "#3398eb", "#ffaa00","#003300", "#f279ea", "#3995e6", "#9d3df2", "#3d6df2", "#a68a53", "#435943", "#3c0059" }

	// step 1 - get all tasks from db
	t, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return err
	}

	switch req.Message {

	case "DailyTaskCount":
		count, orderdKeys := CountNumUtasksPerDay(*t)
		for _, k := range orderdKeys {
			log.WithFields(log.Fields{"k":k}).Info("sending count")

			if err := stream.Send(&protother.PointReply{ EChartType:protother.ChartType_BAR_CHART, X:k, Y:int32(count[k]), XLabel:"date", YLabel:"task count", Title:"Daily UTask Count" }); err!=nil {
				return err
			}
		}

	case "ProjectCount":
		count := CountUtaskPerProject(*t)
		colorIndex := 0
		for p, c := range count {
			if err := stream.Send(&protother.PointReply{ EChartType:protother.ChartType_PIE_CHART, X:p, Y:int32(c), XLabel:"date", YLabel:"task count", Title:"Daily UTask Count" , ColorCode:ColorCodes[colorIndex%len(ColorCodes)]}); err!=nil {
				return err
			}
			colorIndex++
		}

	default:
		log.WithFields(log.Fields{"req:":req.Message}).Error("cant serve plot request")
		return errors.New("cant serve plot request")
	}

	return nil
}

// GetDailyTaskCount
// return number of tasks per day
func (u UTaskServer)  GetDailyTaskCount(req *protother.TaskRequest, strm protother.Tasks_GetDailyTaskCountServer) error {

	// step 1 - get all tasks from db
	t, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return err
	}

	// step 2 - count the number of tasks per day
	count, orderdKeys := CountNumUtasksPerDay(*t)
	for _, k := range orderdKeys {
		log.WithFields(log.Fields{"k":k}).Info("sending count")

		if err := strm.Send(&protother.DailyTaskCount{Date:k,Count:int32(count[k]), ChartType:protother.ChartType_BAR_CHART}); err!=nil {
			return err
		}
	}

	return nil
}


// GetProjectTaskCount
// returns the number of utasks per project
func (u UTaskServer)  GetProjectTaskCount(req *protother.TaskRequest, stream protother.Tasks_GetProjectTaskCountServer) error {

	// step 1 - get all tasks from db
	t, err := QueryAllTasks()
	if err != nil {
		log.WithFields(log.Fields{"err":err}).Error("cant get tasks from db")
		return err
	}

	// step 2 - count the utask per project and stream
	count := CountUtaskPerProject(*t)
	for p, c := range count {
		if err := stream.Send(&protother.ProjectTaskCount{Project:p, Count:int32(c), ChartType:protother.ChartType_PIE_CHART}); err!=nil {
			return err
		}
	}

	return nil
}

// GrpcServer
// gRPC server for the db contents
func GrpcServer() {
	l, err := net.Listen("tcp", GrpcPort)

	if err!=nil {
		log.WithFields(log.Fields{"err":err}).Error("cant listen")
		return
	}

	s := gRPC.NewServer()

	protother.RegisterTasksServer(s, UTaskServer{})
	if err = s.Serve(l); err != nil {
		log.WithFields(log.Fields{"err":err}).Error("error serving")
	}
}

