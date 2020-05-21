ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-dynamodb-local" \
      org.label-schema.description="alpine-dynamodb-local image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/dynamodb-local && \
    addgroup -S dynamodb-local && \
    adduser -S -D -g "" -G dynamodb-local -s /sbin/nologin -h /var/lib/dynamodb-local dynamodb-local && \
    chown dynamodb-local:dynamodb-local /var/lib/dynamodb-local

RUN apk add --update openjdk8-jre tar && \
    mkdir /usr/local/dynamodb-local && \
    cd /usr/local/dynamodb-local && \
    curl -sSL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar -xzo && \
    rm /usr/local/dynamodb-local/DynamoDBLocal_lib/*sqlite4java* && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8000
VOLUME ["/var/lib/dynamodb-local"]
