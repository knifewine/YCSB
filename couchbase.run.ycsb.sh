#!/bin/bash

mkdir -p trials/couchbase

TRIAL=couchbase_`date +%Y-%m-%d_%H-%M-%S`

DISTRIBUTION="uniform"

echo "Run..."
bin/ycsb run couchbase2 -s -P workloads/ryan_couchbase > trials/couchbase/cb.$TRIAL.$DISTRIBUTION.run.out 2> trials/couchbase/cb.$TRIAL.$DISTRIBUTION.run.err

