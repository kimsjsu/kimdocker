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
FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet wget curl tree
RUN apt-get install -y python3 python3-pip
RUN pip3 install pymongo
EOF

docker build -t "myimage:Dockerfile" .

docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 mycluster

#docker run -it --name c0 --network mycluster --ip 192.168.10.100 myimage:Dockerfile
#docker run -it --name c1 --network mycluster --ip 192.168.10.101 myimage:Dockerfile
#docker run -it --name c2 --network mycluster --ip 192.168.10.102 myimage:Dockerfile

docker ps -a


