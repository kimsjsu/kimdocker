#!/bin/bash


if [ $# -eq 1 ]; then
  node_qty=$1
  if [[ $node_qty -gt 0 && $node_qty -lt 10 ]]; then
    for n in $(seq 1 $node_qty); do
      docker run -itd --name node$n -h node$n --net mycluster --ip 192.168.10.10$n myimage:Dockerfile
    done
  else
    echo "Usage: $0 N where 0 < N < 10"
    exit 1
  fi
else
  docker run -itd --name node0 -h node0 --net mycluster --ip 192.168.10.100 myimage:Dockerfile
  docker run -itd --name node1 -h node1 --net mycluster --ip 192.168.10.101 myimage:Dockerfile
  docker run -itd --name node2 -h node2 --net mycluster --ip 192.168.10.102 myimage:Dockerfile
fi

echo ""
echo "$ docker ps -a"
docker ps -a

