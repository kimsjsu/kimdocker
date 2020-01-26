#!/bin/bash

cat << EOF > /tmp/replSet.js
rs.initiate()
rs.status()
rs.add("node2:27017")
rs.add("node3:27017")
rs.status()
rs.conf()
exit
EOF

mongo < /tmp/replSet.js

