ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-consul" \
    org.label-schema.description="alpine-syncthing image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/syncthing/syncthing/releases/download/v1.20.2/syncthing-linux-amd64-v1.20.2.tar.gz /tmp/syncthing.tar.gz

RUN tar -xzf /tmp/syncthing.tar.gz -C /tmp --strip-components 1 && \
    rm /tmp/syncthing.tar.gz && \
    mv /tmp/syncthing /usr/local/bin && \
    rm -fr /tmp/.metadata /tmp/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8384 22000 21027/udp
VOLUME ["/var/lib/syncthing", "/data"]
