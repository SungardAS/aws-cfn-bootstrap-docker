FROM python:2-alpine

RUN mkdir /scripts \
 && apk update \
 && apk add docker \
 && apk add curl \
 && apk add bash \
 && pip install awscli \
 && pip install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz

ADD http://s3.amazonaws.com/ec2metadata/ec2-metadata /usr/local/bin/ec2-metadata.bash
RUN chmod 755 /usr/local/bin/ec2-metadata.bash

ADD scripts/* /scripts/
RUN chmod +x /scripts/*

RUN mv /scripts/ec2-metadata /usr/local/bin/ec2-metadata

WORKDIR /scripts

ENTRYPOINT ["/scripts/entry.sh"]

CMD ["run.sh"]
