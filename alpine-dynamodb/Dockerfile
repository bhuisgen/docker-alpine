FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/dynamodb && \
    cd /usr/local/dynamodb && \
    curl -sSL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar xz && \
    rm /usr/local/dynamodb/DynamoDBLocal_lib/*sqlite4java* && \
    mkdir -p /var/lib/dynamodb && \
    addgroup dynamodb && \
    adduser -S -D -g "" -G dynamodb -s /sbin/nologin -h /var/lib/dynamodb dynamodb && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8000
VOLUME ["/var/lib/dynamodb"]
