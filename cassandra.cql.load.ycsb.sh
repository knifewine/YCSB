#!/bin/bash

mkdir -p trials/cassandra
TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "drop keyspace if exists usertable;
drop keyspace if exists ycsb;
create keyspace ycsb WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 3 };
create table ycsb.usertable (
    y_id varchar primary key,
    field0 blob,
    field1 blob,
    field2 blob,
    field3 blob,
    field4 blob);
" | ~/fab/cassandra/bin/cqlsh node1

sleep 10

echo "Load..."
bin/ycsb load cassandra-cql -s -P workloads/russ_8692 > trials/cassandra/cass.$TRIAL.cql.load.out 2> trials/cassandra/cass.$TRIAL.cql.load.err
#bin/ycsb load cassandra-cql -s -P workloads/test > trials/cassandra/cass.$TRIAL.cql.load.out 2> trials/cassandra/cass.$TRIAL.cql.load.err
