#!/bin/bash

docker stop $(docker ps -qa)
docker rm $(docker ps -qa)

#docker rmi $(docker images -qa)

docker network rm my-mongo-cluster

