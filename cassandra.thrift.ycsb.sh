#!/bin/bash

TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "drop keyspace usertable;
create keyspace usertable with placement_strategy = 'org.apache.cassandra.locator.SimpleStrategy' and strategy_options = {replication_factor:1};
use usertable; 
create column family data;" | ~/fab/cassandra/bin/cassandra-cli -h bdplab2

echo "Load..."
bin/ycsb load cassandra-10 -s -P workloads/ryan_2/cassandra.props -P workloads/ryan_2/workload_ryan -P workloads/ryan_2/workload_ryan_load > trials/cassandra/cass.$TRIAL.load.out 2> trials/cassandra/cass.$TRIAL.load.err

echo "Run..."
bin/ycsb run cassandra-10 -s -P workloads/ryan_2/cassandra.props -P workloads/ryan_2/workload_ryan -P workloads/ryan_2/workload_ryan_run > trials/cassandra/cass.$TRIAL.run.out 2> trials/cassandra/cass.$TRIAL.run.err
