FROM alpine:3.16

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-terraform" \
    org.label-schema.description="alpine-terraform image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip /tmp/terraform.zip

RUN apk add --update --no-cache --progress zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    rm /tmp/terraform.zip && \
    apk del zip

ENTRYPOINT ["/usr/local/bin/terraform"]
CMD []

VOLUME ["/data"]
WORKDIR /data
