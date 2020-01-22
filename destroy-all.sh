#!/bin/bash

docker rm -f $(docker ps -qa)
docker rmi $(docker images -qa)
docker network rm mycluster
docker system prune -f
docker system prune --volumes -f
docker ps -a
docker images -a
docker system df
