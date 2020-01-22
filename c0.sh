#!/bin/bash

docker run -it \
 --name c0 \
 -h node0 \
 --net mycluster \
 --ip 192.168.10.100 \
 --add-host node1:192.168.10.101 \
 --add-host node2:192.168.10.102 \
 myimage:Dockerfile

