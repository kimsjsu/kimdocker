#!/bin/bash

echo -e "\n\033[30;48;5;82m*** Running mongo commands from node1 to populate test data:\033[0m\n"

cat <<EOF > /tmp/populate-testdata.js
use test
var bulk = db.test_collection.initializeUnorderedBulkOp();
people = ["Marc", "Bill", "George", "Eliot", "Matt", "Trey", "Tracy", "Greg", "Steve", "Kristina", "Katie", "Jeff"];
for(var i=0; i<1000000; i++){
   user_id = i;
   name = people[Math.floor(Math.random()*people.length)];
   number = Math.floor(Math.random()*10001);
   bulk.insert( { "user_id":user_id, "name":name, "number":number });
}
bulk.execute();
EOF

mongo < /tmp/populate-testdata.js

echo -e "\n\033[30;48;5;82mPopulating test data is complete, using the following commands on node1:\033[0m\n"
cat /tmp/populate-testdata.js
echo ""

