package dbcontainer

import (
	"context"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/api/types/mount"
	"github.com/docker/docker/api/types/network"
	"github.com/docker/docker/client"
	log "github.com/sirupsen/logrus"
	"io"
	"os"
	"strings"
)

// IsContainerRunning
// check if the container exists and is running
func IsContainerRunning(name string) bool {

	contExist, cont := containerExists(name)

	return contExist && cont.State == "running"
}


// containerExists
// check if a container with given name exits
func containerExists(name string) (bool, *types.Container ) {

	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()

	containers, err := cli.ContainerList(context.Background(), types.ContainerListOptions{All:true})
	if err != nil {
		panic(err)
	}
	for _, cont := range containers {
		log.Printf("Detected container: %+v state: %v\n", cont.Names, cont.State)

		for _, contName := range cont.Names {
			if strings.Contains(contName, name) {
				return true, &cont
			}

		}
	}

	return false, nil
}

// CreateMongodbContainer
// check if a container with the given name exists
// if not, create the container and start it
// if the container exists but is not running, restart it
// if it is already running then leave it as is
func CreateMongodbContainer(name string) {

	contExits, cont := containerExists(name)
	if !contExits {

		imageName := "mongo:4.0.4"
		cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
		if err != nil {
			panic(err)
		}
		defer cli.Close()

		ctx := context.Background()

		out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
		if err != nil {
			panic(err)
		}
		io.Copy(os.Stdout, out)

		// set configs for the container
		config := &container.Config{
			Image: imageName,
			/*
			   ExposedPorts: nat.PortSet{
			      "27017/tcp": struct{}{},
			   },*/
		}

		/*
		   portMap := nat.PortMap{
		      "27017/tcp": []nat.PortBinding{
		         {
		            HostIP: "0.0.0.0",
		            HostPort: "27017",
		         },
		      },
		   }
		*/

		hostConfig := &container.HostConfig{
			Mounts: []mount.Mount{
				{
					Type:   mount.TypeBind,
					Source: "/opt/utask/db",
					Target: "/data/db",
				},
			},
		}

		netCfg := &network.NetworkingConfig{}

		resp, err := cli.ContainerCreate(ctx, config, hostConfig, netCfg, name)
		if err != nil {
			panic(err)
		}

		if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
			panic(err)
		}

	} else if cont.State != "running" {

		log.WithFields(log.Fields{"container state": cont.State}).Info("Container exists but not running, restarting")

		cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
		if err != nil {
			panic(err)
		}
		defer cli.Close()

		if err := cli.ContainerStart(context.Background(), cont.ID, types.ContainerStartOptions{}); err != nil {
			panic(err)
		}
	}

}

