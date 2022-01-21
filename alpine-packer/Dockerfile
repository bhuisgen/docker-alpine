FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-packer" \
      org.label-schema.description="alpine-packer image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV PACKER_VERSION=1.7.8

RUN apk add --update curl zip && \
    curl -sSL https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
        -o /tmp/packer.zip && \
    unzip /tmp/packer.zip -d /usr/bin && \
    rm /tmp/packer.zip && \
    apk del curl zip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/packer"]
CMD []

VOLUME ["/data"]
WORKDIR /data
