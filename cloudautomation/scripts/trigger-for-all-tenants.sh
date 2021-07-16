#!/usr/bin/env bash

set -eu

source $1

# usage:
# trigger-for-all-tenants: ./trigger-for-all-tenants.sh tenants.sh delivery-demo production grabnerandi/simplenodeservice:3.0.0

instanceCount=${#INSTANCE_ARRAY[@]}

# now either create a single or multiple instances
for (( instanceIx=0; instanceIx<instanceCount; instanceIx++ ))
do
    INSTANCE_NAME=${INSTANCE_ARRAY[$instanceIx]}

    echo "Onboard Keptn Service: ${INSTANCE_SERVICE_NAME} for project ${PROJECT_NAME} with provided helm charts"
    keptn trigger delivery --project=$2 --stage=$3 --service=$INSTANCE_SERVICE_NAME --image=$4
done