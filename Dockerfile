FROM python:2-alpine

RUN mkdir /scripts \
 && apk update \
 && apk add docker \
 && pip install awscli \
 && pip install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz

ADD scripts/* /scripts/
RUN chmod +x /scripts/*

WORKDIR /scripts

ENTRYPOINT ["/scripts/entry.sh"]

CMD ["run.sh"]
