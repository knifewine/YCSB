#!/bin/bash

mkdir -p trials/cassandra
TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "drop keyspace usertable;
create keyspace usertable with placement_strategy = 'org.apache.cassandra.locator.SimpleStrategy' and strategy_options = {replication_factor:1};
use usertable; 
create column family data;" | ~/fab/cassandra/bin/cassandra-cli -h node0

sleep 10

echo "Load..."
bin/ycsb load cassandra-10 -s -P workloads/ryan_couchbase_1/cassandra.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_write > trials/cassandra/cass.thrift.$TRIAL.load.out 2> trials/cassandra/cass.thrift.$TRIAL.load.err

echo "Run..."
bin/ycsb run cassandra-10 -s -P workloads/ryan_couchbase_1/cassandra.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_read > trials/cassandra/cass.thrift.$TRIAL.run.out 2> trials/cassandra/cass.thrift.$TRIAL.run.err

