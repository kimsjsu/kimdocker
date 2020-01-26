#!/bin/bash


create_container() {
  docker run -td --name node$1 -h node$1 --net mycluster --ip 192.168.10.1$2 myimage:Dockerfile
}

if [ $# -eq 1 ]; then
  node_qty=$1
  if [[ $node_qty -gt 0 && $node_qty -lt 100 ]]; then
    for n in $(seq -w 01 $node_qty); do
      if [ $n -lt 10 ]; then
        n1=$(echo $n|sed 's/0//')
      else
        n1=$n
      fi
      create_container $n1 $n
    done
  else
    echo "Usage: $0 N where 0 < N < 100"
    exit 1
  fi
else
  for n in 1 2 3; do
    docker ps -a |grep -q node$n ||create_container $n $n
  done
fi

echo ""
echo "$ docker ps -a"
docker ps -a

