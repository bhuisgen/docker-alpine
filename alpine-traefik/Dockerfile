ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

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

RUN mkdir /var/lib/traefik && \
    addgroup -S traefik && \
    adduser -S -D -g "" -G traefik -s /sbin/nologin -h /var/lib/traefik traefik

ADD https://github.com/traefik/traefik/releases/download/v2.10.1/traefik_v2.10.1_linux_amd64.tar.gz /tmp/traefik.tar.gz

RUN apk add --update --no-cache --progress tar && \
    mkdir /usr/local/traefik && \
    tar -xzf /tmp/traefik.tar.gz -C /usr/local/traefik && \
    rm /tmp/traefik.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80 443
