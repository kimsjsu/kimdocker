#!/bin/bash

for n in 0 1 2; do
  docker run -itd \
    --name node$n \
    -h node$n \
    --net mycluster \
    --ip 192.168.10.10$n \
    myimage:Dockerfile
done


docker ps -a

