#!/bin/bash

docker run -it --name c1 -h node1 --ip 192.168.10.101 --net mycluster myimage:Dockerfile

