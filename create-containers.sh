#!/bin/bash


if [ $# -eq 1 ]; then
  node_qty=$1
  if [[ $node_qty -gt 0 && $node_qty -lt 100 ]]; then
    for n in $(seq -w 01 $node_qty); do
      if [ $n -lt 10 ]; then
        n1=$(echo $n|sed 's/0//')
      else
        n1=$n
      fi
      docker run -td --name node$n1 -h node$n1 --net mycluster --ip 192.168.10.1$n myimage:Dockerfile
    done
  else
    echo "Usage: $0 N where 0 < N < 100"
    exit 1
  fi
else
  docker run -td --name node1 -h node1 --net mycluster --ip 192.168.10.101 myimage:Dockerfile
  docker run -td --name node2 -h node2 --net mycluster --ip 192.168.10.102 myimage:Dockerfile
  docker run -td --name node3 -h node3 --net mycluster --ip 192.168.10.103 myimage:Dockerfile
fi

echo ""
echo "$ docker ps -a"
docker ps -a

