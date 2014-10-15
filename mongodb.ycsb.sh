#!/bin/bash

TRIAL=`date +%Y-%m-%d_%H-%M-%S`

echo "
use ycsb
db.dropDatabase()
" | ~/mongo/mongodb-linux-x86_64-2.6.1/bin/mongo --host bdplab1

echo "Load..."
bin/ycsb load mongodb -s -P workloads/ryan_2/mongodb.props -P workloads/ryan_2/workload_ryan -P workloads/ryan_2/workload_ryan_load > trials/mongodb/mongo.$TRIAL.load.out 2> trials/mongodb/mongo.$TRIAL.load.err

echo "Run..."
bin/ycsb run mongodb -s -P workloads/ryan_2/mongodb.props -P workloads/ryan_2/workload_ryan -P workloads/ryan_2/workload_ryan_run > trials/mongodb/mongo.$TRIAL.run.out 2> trials/mongodb/mongo.$TRIAL.run.err
