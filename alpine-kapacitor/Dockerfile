ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-kapacitor" \
    org.label-schema.description="alpine-kapacitor image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/kapacitor && \
    addgroup -S kapacitor && \
    adduser -S -D -g "" -G kapacitor -s /sbin/nologin -h /var/lib/kapacitor kapacitor && \
    chown kapacitor:kapacitor /var/lib/kapacitor && \
    chmod 700 /var/lib/kapacitor

ADD https://dl.influxdata.com/kapacitor/releases/kapacitor-1.6.4_linux_amd64.tar.gz /tmp/kapacitor.tar.gz

RUN apk add --update --no-cache --progress libc6-compat tar && \
    mkdir /usr/local/kapacitor /var/log/kapacitor && \
    tar -xzf /tmp/kapacitor.tar.gz -C /usr/local/kapacitor --strip-components 2 && \
    rm /tmp/kapacitor.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9092
VOLUME ["/var/lib/kapacitor"]
