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

RUN mkdir /var/lib/portainer && \
    addgroup -S portainer && \
    adduser -S -D -g "" -G portainer -s /bin/sh -h /var/lib/portainer portainer && \
    chown portainer:portainer /var/lib/portainer && \
    chmod 700 /var/lib/portainer

ADD https://github.com/portainer/portainer/releases/download/2.13.1/portainer-2.13.1-linux-amd64.tar.gz \
        /tmp/portainer.tar.gz

RUN tar -xzf /tmp/portainer.tar.gz -C /usr/local && \
    rm /tmp/portainer.tar.gz

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/lib/portainer"]
