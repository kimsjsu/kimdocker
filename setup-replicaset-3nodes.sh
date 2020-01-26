#!/bin/bash

for n in 1 2 3; do
  docker ps -a |grep -q node$n
  if [ $? -ne 0 ]; then
    echo -e "\n\033[1;31mERROR: 3 containers need to exist and be up first.\033[0m\n"
    exit 1
  fi
done

docker cp Files-to-copy/setup-replication.sh node1:/tmp
docker cp Files-to-copy/populate-testdata.sh node1:/tmp

for n in 1 2 3; do
  docker exec -t node$n service mongod start
done

sleep 3

docker exec -t node1 /tmp/setup-replication.sh
docker exec -t node1 /tmp/populate-testdata.sh

