FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV LOGSTASH_VERSION=2.3.3

RUN mkdir -p /var/lib/logstash && \
    addgroup -S logstash && \
    adduser -S -D -g "" -G logstash -s /sbin/nologin -h /var/lib/logstash logstash && \
    chown -R logstash:logstash /var/lib/logstash

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/logstash && \
    curl -sSL https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz | tar -xzo -C /usr/local/logstash --strip-components 1 && \
    rm -fr /usr/local/logstash/bin/*.bat && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10514 10514/udp 12201/udp
