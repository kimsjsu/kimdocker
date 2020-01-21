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
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet
EOF

docker build -t "myimage:Dockerfile" .

docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 my-mongo-cluster

docker run -d --name c0 --network my-mongo-cluster --ip 192.168.10.100 myimage:Dockerfile mongod --replSet testset
docker run -d --name c1 --network my-mongo-cluster --ip 192.168.10.101 myimage:Dockerfile mongod --replSet testset
docker run -d --name c2 --network my-mongo-cluster --ip 192.168.10.102 myimage:Dockerfile mongod --replSet testset

docker ps -a

docker cp ../setup_replication.sh c0:/
docker exec -it c0 chown root:root /setup_replication.sh
docker exec -it c0 chmod 755 /setup_replication.sh
docker exec -it c0 /setup_replication.sh

