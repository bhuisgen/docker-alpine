ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-portainer" \
      org.label-schema.description="alpine-portainer image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION"

ENV PORTAINER_VERSION=2.9.3 \
    PORTAINER_HOME=/var/lib/portainer

RUN mkdir ${PORTAINER_HOME} && \
    addgroup -S portainer && \
    adduser -S -D -g "" -G portainer -s /bin/sh -h ${PORTAINER_HOME} portainer && \
    chown portainer:portainer ${PORTAINER_HOME}

RUN curl -sSL https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | \
    tar -xzo -C /usr/local

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/lib/portainer"]
