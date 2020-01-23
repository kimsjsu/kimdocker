#!/bin/bash


docker run -itd --name node0 -h node0 --net mycluster --ip 192.168.10.100 myimage:Dockerfile

docker run -itd --name node1 -h node1 --net mycluster --ip 192.168.10.101 myimage:Dockerfile

docker run -itd --name node2 -h node2 --net mycluster --ip 192.168.10.102 myimage:Dockerfile

echo ""
echo "$ docker ps -a"
docker ps -a

