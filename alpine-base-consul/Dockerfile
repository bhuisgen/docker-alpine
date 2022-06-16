ARG BASE
ARG TAG

FROM bhuisgen/alpine-base:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-base-consul" \
    org.label-schema.description="alpine-base-consul image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0" \
    fr.hbis.docker.base-consul.build-date="$BUILD_DATE" \
    fr.hbis.docker.base-consul.name="alpine-base-consul" \
    fr.hbis.docker.base-consul.vendor="Boris HUISGEN" \
    fr.hbis.docker.base-consul.version="$BUILD_VERSION"

RUN mkdir /var/lib/consul && \
    addgroup -g 500 -S consul && \
    adduser -u 500 -S -D -g "" -G consul -s /sbin/nologin -h /var/lib/consul consul && \
    chown consul:consul /var/lib/consul && \
    chmod 700 /var/lib/consul

ADD https://releases.hashicorp.com/consul-template/0.29.0/consul-template_0.29.0_linux_amd64.zip \
        /tmp/consul-template.zip

RUN apk add --update --no-cache --progress zip && \
    unzip /tmp/consul-template.zip -d /bin && \
    rm /tmp/consul-template.zip && \
    apk del zip

COPY rootfs/ /

HEALTHCHECK CMD "/usr/sbin/container-check"
