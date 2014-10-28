#!/bin/bash

mkdir -p trials/cassandra

TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "drop keyspace if exists usertable;
drop keyspace if exists ycsb;
create keyspace ycsb WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 1 };
create table ycsb.usertable (
    y_id varchar primary key,
    f0 varchar,
    f1 varchar,
    f2 varchar,
    f3 varchar,
    f4 varchar);
" | ~/fab/cassandra/bin/cqlsh node0

sleep 10

echo "Load..."
bin/ycsb load cassandra-cql -s -P workloads/ryan_couchbase_1/cassandra.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_write > trials/cassandra/cass.$TRIAL.load.out 2> trials/cassandra/cass.$TRIAL.load.err

echo "Run..."
bin/ycsb run cassandra-cql -s -P workloads/ryan_couchbase_1/cassandra.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_read > trials/cassandra/cass.$TRIAL.run.out 2> trials/cassandra/cass.$TRIAL.run.err


