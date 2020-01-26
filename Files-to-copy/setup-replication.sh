#!/bin/bash

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


