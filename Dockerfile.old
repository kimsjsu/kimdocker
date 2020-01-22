FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y
#RUN apt install -y vim wamerican iputils-ping iproute2 telnet wget curl tree sudo git gnupg
#RUN apt install -y python3 python3-pip
#RUN pip3 install pymongo
RUN apt install -y wget gnupg
RUN wget https://www.mongodb.org/static/pgp/server-4.2.asc > /dev/null 2>&1
RUN apt-key add server-4.2.asc
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.2.list
ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/ /etc/localtime && echo  > /etc/timezone
RUN apt update
RUN apt install -y mongodb-org
COPY ./mongod-service /tmp/mongod-copied
COPY ./mongod.conf /tmp/mongod.conf-copied
COPY ./setup_replication.sh /tmp/setup_replication.sh-copied
RUN tr -d '\015' < /tmp/mongod-copied > /etc/init.d/mongod
RUN tr -d '\015' < /tmp/mongod.conf-copied > /etc/mongod.conf
RUN tr -d '\015' < /tmp/setup_replication.sh-copied > /tmp/setup_replication.sh
RUN rm -f /tmp/*copied
RUN chmod 755 /etc/init.d/mongod /tmp/setup_replication.sh
RUN update-rc.d mongod defaults
