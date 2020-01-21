#!/bin/bash

containers=$(docker ps -qa |wc -l)

if [ $containers -ge 1 ]; then
  docker stop $(docker ps -qa)
  docker rm $(docker ps -qa)
fi

none_images=$(docker images -a|awk '/none/ {print $3}')

for image in $none_images; do
  docker rmi $image
done

#docker rmi $(docker images -qa)

docker network rm my-mongo-cluster

