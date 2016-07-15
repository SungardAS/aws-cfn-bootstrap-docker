#!/bin/ash
set -e

# Helper function
error_exit()
{
  cfn-signal -e 1 -r "$1" --stack $CFN_STACK_NAME --resource $CFN_NOTIFY_RESOURCE --region $AWS_DEFAULT_REGION

  exit 1
}

# Process CloudFormation init definitions
cfn-init -s $CFN_STACK_NAME -r $CFN_METADATA_RESOURCE -c "$CFN_CONFIG_SETS" \
    --region $AWS_DEFAULT_REGION || error_exit 'Failed to run cfn-init'

# All is well so signal success
cfn-signal -e 0 -r "Stack setup complete" \
  --stack $CFN_STACK_NAME \
  --resource $CFN_NOTIFY_RESOURCE \
  --region $AWS_DEFAULT_REGION

#EOF

