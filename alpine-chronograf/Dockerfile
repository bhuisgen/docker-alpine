ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-chronograf" \
    org.label-schema.description="alpine-chronograf image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/chronograf && \
    addgroup -S chronograf && \
    adduser -S -D -g "" -G chronograf -s /sbin/nologin -h /var/lib/chronograf chronograf && \
    chown chronograf:chronograf /var/lib/chronograf && \
    chmod 700 /var/lib/chronograf

ADD https://dl.influxdata.com/chronograf/releases/chronograf-1.9.4_linux_amd64.tar.gz /tmp/chronograf.tar.gz

RUN apk add --update --no-cache --progress libc6-compat tar && \
    mkdir /usr/local/chronograf && \
    tar -xzf /tmp/chronograf.tar.gz -C /usr/local/chronograf --strip-components 2 && \
    rm /tmp/chronograf.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
VOLUME ["/var/lib/chronograf"]
