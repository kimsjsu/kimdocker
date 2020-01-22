#!/bin/bash

./destroy-all.sh
./bootstrap-ubuntu.sh
./create-containers.sh

runcmd() {
	echo ""
	echo "$ $1"
	$1
}

runcmd "docker network ls"
runcmd "docker images -a"
runcmd "docker ps -a"

