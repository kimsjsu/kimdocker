#!/bin/bash

cat << EOF > /tmp/replSet.js
rs.initiate()
rs.status()
rs.add("192.168.10.101:27017")
rs.add("192.168.10.102:27017")
rs.status()
rs.conf()
exit
EOF

mongo < /tmp/replSet.js

