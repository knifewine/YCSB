#!/bin/bash

mkdir -p trials/cassandra
TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "drop keyspace usertable;
create keyspace usertable with placement_strategy = 'org.apache.cassandra.locator.SimpleStrategy' and strategy_options = {replication_factor:1};
use usertable; 
create column family data WITH compression_options=null;" | ~/fab/cassandra/bin/cassandra-cli -h node0

sleep 10

echo "Load..."
bin/ycsb load cassandra-10 -s -P workloads/ryan_couchbase > trials/cassandra/cass.$TRIAL.thrift.uniform.load.out 2> trials/cassandra/cass.$TRIAL.thrift.uniform.load.err


