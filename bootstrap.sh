#!/bin/bash

which docker || (echo "docker does not exist"; exit 1)

mydir="mydir1"

if [ ! -d $mydir ]; then
  mkdir $mydir
fi

cd $mydir

if [ -f "Dockerfile" ]; then
  mv Dockerfile Dockerfile.old
fi

cat > Dockerfile <<EOF
FROM mongo:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet python3 python3-pip pymongo
EOF

docker build . -t "myimage1:Dockerfile"

docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 my-mongo-cluster

docker run -d --name c0 --ip 192.168.10.100 --network my-mongo-cluster myimage:Dockerfile mongod --replSet testset
docker run -d --name c1 --ip 192.168.10.101 --network my-mongo-cluster myimage:Dockerfile mongod --replSet testset
docker run -d --name c2 --ip 192.168.10.102 --network my-mongo-cluster myimage:Dockerfile mongod --replSet testset

sleep 3

docker ps -a

