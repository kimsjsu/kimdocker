FROM ubuntu:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet wget curl tree sudo
RUN apt-get install -y python3 python3-pip
RUN pip3 install pymongo
COPY ./service-mongod /etc/init.d/mongod
RUN chmod 755 /etc/init.d/mongod
RUN update-rc.d mongod defaults
