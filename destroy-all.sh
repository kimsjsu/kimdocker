#!/bin/bash

runcmd() {
        echo ""
        echo "$ $1"
        $1
}

runcmd "docker rm -f $(docker ps -qa)"
runcmd "docker rmi $(docker images -qa)"
runcmd "docker network rm mycluster"
runcmd "docker system prune -f"
runcmd "docker system prune --volumes -f"
runcmd "docker ps -a"
runcmd "docker images -a"
runcmd "docker system df"

echo ""
