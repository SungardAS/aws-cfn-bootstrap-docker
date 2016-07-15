#!/bin/ash
set -e

if [ -n "$ECR_REGISTRY_IDS" ]; then
  /scripts/run_ecr_login.sh
fi

if [ -n "$CFN_METADATA_RESOURCE" ]; then
  /scripts/run_cfn_init.sh
fi
