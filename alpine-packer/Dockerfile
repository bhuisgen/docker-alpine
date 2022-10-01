FROM alpine:3.16

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

ADD https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_linux_amd64.zip /tmp/packer.zip

RUN apk add --update --no-cache --progress zip && \
    unzip /tmp/packer.zip -d /usr/bin && \
    rm /tmp/packer.zip && \
    apk del zip

ENTRYPOINT ["/usr/bin/packer"]
CMD []

VOLUME ["/data"]
WORKDIR /data
