#!/bin/bash

TRIAL=community_`date +%Y-%m-%d_%H-%M-%S`

/opt/couchbase/bin/couchbase-cli bucket-delete -c node0 --bucket=default -u Administrator -p asdf12

/opt/couchbase/bin/couchbase-cli bucket-create -c node0 --bucket=default --bucket-type=couchbase --bucket-ramsize=1024 --bucket-replica=1 --wait -u Administrator -p asdf12

sleep 10


echo "Load..."
bin/ycsb load couchbase2 -s -P workloads/ryan_couchbase_1/couchbase.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_write > trials/couchbase/cb.$TRIAL.load.out 2> trials/couchbase/cb.$TRIAL.load.err

echo "Run..."
bin/ycsb run couchbase2 -s -P workloads/ryan_couchbase_1/couchbase.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_read > trials/couchbase/cb.$TRIAL.run.out 2> trials/couchbase/cb.$TRIAL.run.err

