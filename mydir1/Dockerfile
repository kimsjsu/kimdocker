FROM mongo:latest
ADD ./mongod.conf /etc/mongod.conf
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y vim wamerican iputils-ping iproute2 telnet python3
RUN apt-get install -y python3-pip
RUN pip3 install pymongo
STOPSIGNAL SIGKILL
