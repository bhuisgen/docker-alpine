ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-logstash" \
    org.label-schema.description="alpine-logstash image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/logstash && \
    addgroup -S logstash && \
    adduser -S -D -g "" -G logstash -s /sbin/nologin -h /var/lib/logstash logstash && \
    chown logstash:logstash /var/lib/logstash && \
    chmod 700 /var/lib/logstash

ADD https://artifacts.elastic.co/downloads/logstash/logstash-8.2.2-linux-x86_64.tar.gz /tmp/logstash.tar.gz

RUN apk add --update --no-cache --progress openjdk11-jre tar && \
    mkdir /usr/local/logstash && \
    tar -xzf /tmp/logstash.tar.gz -C /usr/local/logstash --strip-components 1 && \
    rm /tmp/logstash.tar.gz && \
    rm -fr /usr/local/logstash/bin/*.bat && \
    mkdir /var/lib/logstash/data /var/lib/logstash/logs && \
    chown logstash:logstash /var/lib/logstash/data /var/lib/logstash/logs && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9600
VOLUME ["/var/lib/logstash"]
