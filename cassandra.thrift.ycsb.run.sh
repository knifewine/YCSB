#!/bin/bash

mkdir -p trials/cassandra
TRIAL=`date +%Y-%m-%d_%H-%M-%S`

DISTRIBUTION="uniform"

echo "Run..."
bin/ycsb run cassandra-10 -s -P workloads/ryan_couchbase > trials/cassandra/cass.$TRIAL.thrift.$DISTRIBUTION.run.out 2> trials/cassandra/cass.$TRIAL.thrift.$DISTRIBUTION.run.err

