ARG BASE
ARG TAG

FROM bhuisgen/alpine-base:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-base-confd" \
      org.label-schema.description="alpine-base-confd image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0" \
      fr.hbis.docker.base-confd.build-date="$BUILD_DATE" \
      fr.hbis.docker.base-confd.name="alpine-base-confd" \
      fr.hbis.docker.base-confd.vendor="Boris HUISGEN" \
      fr.hbis.docker.base-confd.version="$BUILD_VERSION"

ENV CONFD_VERSION=0.16.0

RUN curl -sSL https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 \
        -o /bin/confd && \
    chmod 755 /bin/confd && \
    mkdir -p /etc/confd

COPY rootfs/ /

HEALTHCHECK CMD "/usr/sbin/container-check"
