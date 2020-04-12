#!/bin/bash
set -e
# utask installation script
#
# See https://github.com/golark/utaskdaemon for more information
#
# This script builds the binary & installs the application
#
# Usage:
#   $ sh install_utask.sh
#
# Make sure the contentss of the script is the same as
# https://github.com/golark/utaskdaemon/install.sh
# before executing

# top level definitions
TOP_DIR=$(dirname "$0")
INSTALL_DIR="/opt/utask"
SERVICE_NAME="utaskdaemon.service"
SERVICE_FILE="$TOP_DIR/$SERVICE_NAME"
USER_SERVICE_DIR=~/.config/systemd/user

# distribution check
get_distribution() {
	dist=""

  # check the os-release file
	if [ -r /etc/os-release ]; then
		dist="$(. /etc/os-release && echo "$ID")"
	fi

	echo "$dist"
}

# pause for a few seconds determined by argument 1 while printing dots
sleep_with_dots() {

  for ((i=1; i<=$1; i++))
    do
      printf "."
      sleep 1
    done
  printf "\n"

}

# stop any active services with the given trace
# this must be done before installingthe binary as well - running service can lock the binary
# also do this before installing a new service with the same footprint
stop_active_service() {

  serviceName=$1

  # stop any potential backround service ( both user and system )
  # check user services
  if (systemctl is-active --quiet --user $serviceName); then
    systemctl stop --user $serviceName
    echo "stopped user service $serviceName"
  fi

  # now check system services
  if (systemctl is-active --quiet $serviceName); then
    systemctl stop $serviceName
    echo "stopped system service $serviceName"
  fi

}

# register the service with service manager ( systemd in this case )
register_service() {

  # step 1 - stop any potential backround utaskdaemon service
  stop_active_service $SERVICE_NAME

  echo "######################################################"
  # step 2 - install service
  echo "registering service"
  mkdir -p $USER_SERVICE_DIR

  echo $SERVICE_FILE
  pwd

  cp $SERVICE_FILE $USER_SERVICE_DIR

  # step 3 - reload user services and start service
  printf "reloading user services"
  systemctl daemon-reload --user
  sleep_with_dots 3
  printf "starting service"
  systemctl start --user $SERVICE_NAME

  # step 3 - short pause & check service states
  sleep_with_dots 3
  if systemctl is-active --quiet --user $SERVICE_NAME; then
    echo "$SERVICE_NAME status: active"
  fi

  echo "######################################################"

}

# check prerequisites and install
install_app() {

  echo "checking prerequisites"

  echo "######################################################"
  # step 1 - check distribution
  dist=$(get_distribution)
  echo "detected OS: $dist"

  # step 2 - check golang installation
  ret=$(go version)
  exitCode=$?
  if [ 0 != $exitCode ]; then
    >&2 echo "can not get go version, check your installation. exiting..."
    exit $exitCode
  else
    echo "detected go: $ret"
  fi

  # step 3 - check GOPATH
  if [ -z $GOPATH ]; then
    >&2 echo "GOPATH is not set exiting"
    exit 1
  else
    echo "GOPATH: $GOPATH"
  fi

  echo "######################################################"
  echo "generating binary utaskdaemon"
  # step 4 - generate binary
  rm -rf ./bin && mkdir ./bin
  ret=$(go build -o ./bin)

  # step 5 - install binary
  sudo mkdir -p $INSTALL_DIR                  # create installation folder
  sudo chown $USER:$USER $INSTALL_DIR      # set permission/group to current user
  echo "installing utaskdaemon binary"
  cp ./bin/utaskdaemon $INSTALL_DIR    # copy binary
  cp ./config.yaml $INSTALL_DIR # copy config file

  echo "application installed to $INSTALL_DIR"
}

# stop service is active
stop_active_service $SERVICE_NAME
# first install the application - bon voyage comrades!
install_app
# now install as service
register_service

