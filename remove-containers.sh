#!/bin/bash

containers=$(docker ps -qa |wc -l)

if [ $containers -ge 1 ]; then
  docker stop $(docker ps -qa)
  docker rm $(docker ps -qa)
  docker network rm mycluster
fi


