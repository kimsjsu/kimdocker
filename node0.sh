#!/bin/bash

docker run -it \
 --name node0 \
 -h node0 \
 --net mycluster \
 --ip 192.168.10.100 \
 myimage:Dockerfile

