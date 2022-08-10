ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-telegraf" \
    org.label-schema.description="alpine-telegraf image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/telegraf && \
    addgroup -S telegraf && \
    adduser -S -D -g "" -G telegraf -s /sbin/nologin -h /var/lib/telegraf telegraf && \
    chown telegraf:telegraf /var/lib/telegraf && \
    chmod 700 /var/lib/telegraf

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.22.4_linux_amd64.tar.gz /tmp/telegraf.tar.gz

RUN apk add --update --no-cache --progress libc6-compat tar && \
    mkdir /usr/local/telegraf && \
    tar -xzf /tmp/telegraf.tar.gz -C /usr/local/telegraf --strip-components 2 && \
    rm /tmp/telegraf.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

VOLUME ["/var/lib/telegraf"]
