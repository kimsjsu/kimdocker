#!/bin/bash

which docker || (echo "docker does not exist"; exit 1)

cat > Dockerfile <<EOF
FROM ubuntu:latest
RUN apt-get update \
 && apt-get install -y \
    apt-utils vim wamerican iputils-ping \
    iproute2 telnet wget curl tree sudo \
    git gnupg wget python3 python3-pip \
 && apt-get clean \
 && pip3 install pymongo \
 && wget https://www.mongodb.org/static/pgp/server-4.2.asc > /dev/null 2>&1 \
 && apt-key add server-4.2.asc \
 && echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.2.list \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo $TZ > /etc/timezone \
 && export TZ=US/Pacific \
 && apt-get update \
 && apt-get install -y mongodb-org \
 && apt-get clean
COPY Files-to-copy/* /tmp/copied/
RUN tr -d '\015' < /tmp/copied/service-script-mongod > /etc/init.d/mongod \
 && tr -d '\015' < /tmp/copied/mongod.conf > /etc/mongod.conf \
 && rm -fr /tmp/copied \
 && chmod 755 /etc/init.d/mongod \
 && update-rc.d mongod defaults
EOF

docker build -t "myimage:Dockerfile" .

docker network ls |grep mycluster > /dev/null || \
docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 mycluster

rm -f Dockerfile
