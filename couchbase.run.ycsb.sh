#!/bin/bash

mkdir -p trials/couchbase

TRIAL=couchbase_`date +%Y-%m-%d_%H-%M-%S`

DISTRIBUTION="uniform"

echo "Run..."
bin/ycsb run couchbase2 -s -P workloads/ryan_couchbase_1/couchbase.props -P workloads/ryan_couchbase_1/workload_ryan -P workloads/ryan_couchbase_1/workload_ryan_read > trials/couchbase/cb.$TRIAL.$DISTRIBUTION.run.out 2> trials/couchbase/cb.$TRIAL.$DISTRIBUTION.run.err

