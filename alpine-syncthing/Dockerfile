ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

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

ENV SYNCTHING_VERSION=1.5.0

RUN curl -sSL https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz | \
    tar -xzo -C /usr/local/bin --strip-components 1 syncthing-linux-amd64-v${SYNCTHING_VERSION}/syncthing

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8384 22000 21027/udp
VOLUME ["/var/lib/syncthing", "/data"]
