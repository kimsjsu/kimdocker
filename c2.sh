#!/bin/bash

docker run -it \
 --name c2 \
 -h node2 \
 --net mycluster \
 --ip 192.168.10.102 \
 --add-host node0:192.168.10.100 \
 --add-host node1:192.168.10.101 \
 myimage:Dockerfile

