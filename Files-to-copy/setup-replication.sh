#!/bin/bash

echo -e "\n\033[30;48;5;82m*** Running mongo commands on node1 to set up a replica set of 3 nodes (node1, node2, node3):\033[0m\n"

run_mongo_cmd() {
  echo -e "\n\033[30;48;5;82mmongo> $1\033[0m\n"
  mongo --eval $1
} 

run_mongo_cmd "rs.initiate()"
run_mongo_cmd "rs.status()"
run_mongo_cmd "rs.add('node2:27017')"
run_mongo_cmd "rs.add('node3:27017')"
run_mongo_cmd "rs.status()"
run_mongo_cmd "rs.conf()"

echo -e "\n\033[30;48;5;82mFinished setting up a replica set of 3 nodes (node1, node2, node3).\033[0m\n"
echo -e "\n\n\n"
