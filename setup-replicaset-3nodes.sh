#!/bin/bash

for n in 0 1 2; do
  docker ps -a |grep -q mongodb$n.example.net
  if [ $? -ne 0 ]; then
    echo -e "\n\033[1;31mERROR: 3 containers need to exist and be up first.\033[0m\n"
    echo "$ docker ps -a"
    docker ps -a
    exit 1
  fi
done

docker cp Files-to-copy/setup-replication.sh mongodb0.example.net:/tmp
docker cp Files-to-copy/populate-testdata.sh mongodb0.example.net:/tmp

for n in 0 1 2; do
  docker exec -t mongodb$n.example.net service mongod start
done

sleep 3

docker exec -t mongodb0.example.net /tmp/setup-replication.sh
docker exec -t mongodb0.example.net /tmp/populate-testdata.sh

