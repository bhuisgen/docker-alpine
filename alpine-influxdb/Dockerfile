ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-influxdb" \
    org.label-schema.description="alpine-influxdb image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/influxdb && \
    addgroup -S influxdb && \
    adduser -S -D -g "" -G influxdb -s /sbin/nologin -h /var/lib/influxdb influxdb && \
    chown influxdb:influxdb /var/lib/influxdb && \
    chmod 700 /var/lib/influxdb

ADD https://dl.influxdata.com/influxdb/releases/influxdb2-2.2.0-linux-amd64.tar.gz /tmp/influxdb.tar.gz

RUN apk add --update --no-cache --progress libc6-compat tar && \
    mkdir /usr/local/influxdb && \
    tar -xzf /tmp/influxdb.tar.gz -C /usr/local/influxdb --strip-components 2 && \
    rm /tmp/influxdb.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8086
VOLUME ["/var/lib/influxdb"]
