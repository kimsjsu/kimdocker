#!/bin/bash

docker run -it --name c2 --ip 192.168.10.102 --net mycluster myimage:Dockerfile

