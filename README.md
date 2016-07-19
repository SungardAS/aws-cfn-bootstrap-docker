# docker-aws-cfn-bootstrap

Bootstrap AWS ec2 with CloudFormation and Docker

## Summary

The host is requried to have docker installed.  This can be done
with `UserData` either through a `cloud-init` definition or a shell
script.

Once docker is available this image can be run with:

    docker run \
      -v /var/run/docker.sock:/var/run/docker.sock
      -e [AWS_DEFAULT_REGION=] -e [CFN_METADATA_RESOURCE=] -e ...
      sungardas/aws-cfn-bootstrap

The container will interface with CloudFormation, can access
CloudFormation Metadata and is able to respond to a `CreationPolicy` or
`WaitCondition`.

Useful for implementations that only run Docker containers and for
minimal operating systems like
[rancheros](https://github.com/rancher/os)

In CloudFormation metadata all commands can be calls to docker.  All
images will be pulled and run by the host docker engine.

## Docker Version

This project creates tags for different versions of docker.  Use a tag
that matches the version of docker the host is running.

    sungardas/aws-cfn-bootstrap:1.10
    sungardas/aws-cfn-bootstrap:1.11


## Available Commands

The image contians the latest [cfn-bootstrap scripts][cfn-bootstrap-url], the [ec2-metadata query tool][query-tool-url] and the [aws cli][aws-cli-url].


## Environment Variables

`AWS_DEFAULT_REGION` - The AWS region to run against.

`CFN_CONFIG_SETS` - List of config sets to run.

`CFN_METADATA_RESOURCE` - The resource containing `AWS::CloudFormation::Init`

`CFN_NOTIFY_RESOURCE` - The resource to send notification to when
complete. Usually one with `CreationPolicy` defined.

`CFN_STACK_NAME` - The name of the CloudFormation Stack

`ECR_REGISTRY_IDS` - If set, will run `aws ecr get-login` and populate
the host docker engine with credentials for ECR.  Recommened to use with
an ec2 instance profile.

## Credits

Inspired by [docker-aws](https://github.com/asynchrony/docker-aws)

## License

Apache-2.0 ©

## Sungard Availability Services | Labs
[![Sungard Availability Services | Labs][labs-logo]][labs-github-url]

This project is maintained by the Labs team at [Sungard Availability
Services](http://sungardas.com)

GitHub: [https://sungardas.github.io](https://sungardas.github.io)

Blog:
[http://blog.sungardas.com/CTOLabs/](http://blog.sungardas.com/CTOLabs/)


[labs-github-url]: https://sungardas.github.io
[labs-logo]: https://raw.githubusercontent.com/SungardAS/repo-assets/master/images/logos/sungardas-labs-logo-small.png

[cfn-bootstrap-url]: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-helper-scripts-reference.html
[query-tool-url]: https://aws.amazon.com/code/1825
[aws-cli-url]: https://aws.amazon.com/cli/
