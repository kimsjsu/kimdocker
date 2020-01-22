#!/bin/bash

cat << EOF > /tmp/replSet.js
rs.initiate()
rs.status()
rs.add("node1:27017")
rs.add("node2:27017")
rs.status()
rs.conf()
exit
EOF

mongo < /tmp/replSet.js

