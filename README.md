# docker-aws-bootstrap

Bootstrap AWS ec2 with CloudFormation and Docker

## Summary

The host is requried to have docker installed.  This can be done
with `UserData` either through a `cloud-init` definition or a shell
script.

Then run:

    docker run --rm \
      -v /var/run/docker.sock:/var/run/docker.sock
      -e [AWS_DEFAULT_REGION=] -e [CFN_METADATA_RESOURCE=] -e ...
      sungardas/aws-cfn-bootstrap

## Environment Variables

`AWS_DEFAULT_REGION`

`CFN_CONFIG_SETS`

`CFN_METADATA_RESOURCE`

`CFN_NOTIFY_RESOURCE`

`CFN_STACK_NAME`

`ECR_REGISTRY_IDS`

## Credits

Inspired by [docker-aws](https://github.com/asynchrony/docker-aws)
