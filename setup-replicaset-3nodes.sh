#!/bin/bash

docker cp Files-to-copy/setup-replication.sh node1:/tmp
docker cp Files-to-copy/populate-testdata.sh node1:/tmp

docker exec -t node1 service mongod start
docker exec -t node2 service mongod start
docker exec -t node3 service mongod start

sleep 3

docker exec -t node1 /tmp/setup-replication.sh
docker exec -t node1 /tmp/populate-testdata.sh

