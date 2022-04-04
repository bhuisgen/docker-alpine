ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV LOGSTASH_VERSION=7.15.2

RUN mkdir /var/lib/logstash && \
    addgroup -S logstash && \
    adduser -S -D -g "" -G logstash -s /sbin/nologin -h /var/lib/logstash logstash && \
    chown logstash:logstash /var/lib/logstash

RUN apk add --update openjdk11-jre tar && \
    mkdir /usr/local/logstash && \
    curl -sSL https://artifacts.elastic.co/downloads/logstash/logstash-${LOGSTASH_VERSION}-linux-x86_64.tar.gz | \
        tar -xzo -C /usr/local/logstash --strip-components 1 && \
    rm -fr /usr/local/logstash/bin/*.bat && \
    mkdir /var/lib/logstash/data /var/lib/logstash/logs && \
    chown logstash:logstash /var/lib/logstash/data /var/lib/logstash/logs && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9600
VOLUME ["/var/lib/logstash"]
