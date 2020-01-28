#!/bin/bash

max=100

docker network ls |grep -q mycluster || \
docker network create --subnet 192.168.10.0/24 --ip-range 192.168.10.0/24 mycluster

create_container() {
  docker run -td --name mongodb$1.example.net -h mongodb$1.example.net --net mycluster --ip 192.168.10.1$2 myimage:Dockerfile
}

if [ $# -eq 1 ]; then
  node_qty=$1
  if [[ $node_qty -gt 0 && $node_qty -lt $max ]]; then
    for nn in $(seq -w 01 $node_qty); do
      if [ $nn -lt 10 ]; then
        n=${nn#0}
      else
        n=$nn
      fi
      create_container $n $nn
    done
  else
    echo -e "\n\033[1;31mUsage: $0 N where 0 < N < $max\033[0m\n"
    exit 1
  fi
else
  for n in 0 1 2; do
    nn="0$n"
    docker ps -a |grep -q mongodb$n.example.net ||create_container $n $nn
  done
fi

echo ""
./check-ipaddresses.sh


