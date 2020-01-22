#!/bin/bash

which docker || (echo "docker does not exist"; exit 1)

mydir="mydir1"

if [ ! -d $mydir ]; then
  mkdir $mydir
fi

cp -p mongod-service mongod.conf setup_replication.sh $mydir
cd $mydir

if [ -f "Dockerfile" ]; then
  mv Dockerfile Dockerfile.old
fi

cat > Dockerfile <<EOF
FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet wget curl tree sudo git gnupg
RUN apt-get install -y python3 python3-pip
RUN pip3 install pymongo
COPY ./mongod-service /etc/init.d/mongod
COPY ./mongod.conf /etc/mongod.conf
COPY ./setup_replication.sh /tmp/setup_replication.sh
RUN chmod 755 /etc/init.d/mongod
RUN update-rc.d mongod defaults
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update
EOF

docker build -t "myimage:Dockerfile" .

docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 mycluster

#docker run -it --name c0 --network mycluster --ip 192.168.10.100 myimage:Dockerfile
#docker run -it --name c1 --network mycluster --ip 192.168.10.101 myimage:Dockerfile
#docker run -it --name c2 --network mycluster --ip 192.168.10.102 myimage:Dockerfile

docker ps -a


