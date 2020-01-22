#!/bin/bash

docker run -it --name c0 -h node0 --ip 192.168.10.100 --net mycluster myimage:Dockerfile

