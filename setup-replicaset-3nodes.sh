#!/bin/bash

c_prefix="node"

for n in 1 2 3; do
  docker ps -a |grep -q $c_prefix$n
  if [ $? -ne 0 ]; then
    echo -e "\n\033[1;31mERROR: 3 containers need to exist and be up first.\033[0m\n"
    echo "$ docker ps -a"
    docker ps -a
    exit 1
  fi
done

docker cp Files-to-copy/setup-replication.sh "$c_prefix"1:/tmp
docker cp Files-to-copy/populate-testdata.sh "$c_prefix"1:/tmp

for n in 1 2 3; do
  docker exec -t $c_prefix$n service mongod start
done

sleep 3

docker exec -t "$c_prefix"1 /tmp/setup-replication.sh
docker exec -t "$c_prefix"1 /tmp/populate-testdata.sh

