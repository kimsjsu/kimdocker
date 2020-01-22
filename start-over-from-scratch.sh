#!/bin/bash

./destroy-all.sh
echo "----------------------------------------------------------------"
./bootstrap-ubuntu.sh
echo "----------------------------------------------------------------"
./create-containers.sh

runcmd() {
	echo ""
	echo "$ $1"
	$1
}

runcmd "docker network ls"
runcmd "docker images -a"
runcmd "docker ps -a"

