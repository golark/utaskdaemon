#!/bin/sh
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
# https://github.com/golark/utaskdaemon/install/install_utask.sh
# before executing
INSTALL_DIR="/opt/utask"


# distribution check
get_distribution() {
	dist=""

  # check the os-release file
	if [ -r /etc/os-release ]; then
		dist="$(. /etc/os-release && echo "$ID")"
	fi

	echo "$dist"
}

# check prerequisites and install
perform_install() {

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
  rm -rf ./bin && mkdir ./bin && cd ./bin
  ret=$(go build ..)

  # step 5 - install binary
  sudo mkdir -p $INSTALL_DIR                  # create installation folder
  sudo chown $USER:$USER $INSTALL_DIR      # set permission/group to current user
  echo "installing new binary $INSTALL_DIR"
  cp utaskdaemon $INSTALL_DIR    # copy binary
  cp ../config.yaml $INSTALL_DIR # copy config file

  exit 0
}

# bon voyage comrades
perform_install

