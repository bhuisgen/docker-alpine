FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/dynamodb && \
    cd /usr/local/dynamodb && \
    curl -sSL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz -o dynamodb.tar.gz && \
    tar xf dynamodb.tar.gz && \
    rm dynamodb.tar.gz && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8000
