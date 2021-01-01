ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-traefik" \
      org.label-schema.description="alpine-traefik image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV TRAEFIK_VERSION=2.3.6

RUN mkdir /var/lib/traefik && \
    addgroup -S traefik && \
    adduser -S -D -g "" -G traefik -s /sbin/nologin -h /var/lib/traefik traefik

RUN apk add --no-cache --update tar && \
    mkdir /usr/local/traefik && \
    curl -sSL https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/traefik && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80 443
