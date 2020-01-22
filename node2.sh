#!/bin/bash

docker run -it \
 --name node2 \
 -h node2 \
 --net mycluster \
 --ip 192.168.10.102 \
 myimage:Dockerfile

