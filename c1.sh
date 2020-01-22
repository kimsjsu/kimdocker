#!/bin/bash

docker run -it \
 --name c1 \
 -h node1 \
 --net mycluster \
 --ip 192.168.10.101 \
 --add-host node2:192.168.10.102 \
 --add-host node0:192.168.10.100 \
 myimage:Dockerfile

