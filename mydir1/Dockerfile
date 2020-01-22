FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet wget curl tree sudo
RUN apt-get install -y python3 python3-pip
RUN pip3 install pymongo
COPY ./service-mongod /etc/init.d/mongod
COPY ./hosts-add /tmp/hosts-add
RUN chmod 755 /etc/init.d/mongod
RUN update-rc.d mongod defaults
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update
