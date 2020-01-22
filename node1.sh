#!/bin/bash

docker run -it \
 --name node1 \
 -h node1 \
 --net mycluster \
 --ip 192.168.10.101 \
 myimage:Dockerfile

