#!/bin/bash

mkdir -p trials/cassandra
TRIAL=`date +%Y-%m-%d_%H-%M-%S`

DISTRIBUTION="uniform"

echo "Run..."
bin/ycsb run cassandra-cql -s -P workloads/russ_8692 > trials/cassandra/cass.$TRIAL.cql.$DISTRIBUTION.run.out 2> trials/cassandra/cass.$TRIAL.cql.$DISTRIBUTION.run.err

