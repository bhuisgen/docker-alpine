FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ELASTICSEARCH_VERSION=6.2.1

RUN mkdir /var/lib/elasticsearch && \
    addgroup -S elasticsearch && \
    adduser -S -D -g "" -G elasticsearch -s /sbin/nologin -h /var/lib/elasticsearch elasticsearch && \
    chown elasticsearch:elasticsearch /var/lib/elasticsearch

RUN apk add --update openjdk8-jre tar && \
    mkdir /usr/local/elasticsearch && \
    curl -sSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz | \
        tar -xzo -C /usr/local/elasticsearch --strip-components 1 && \
    rm -fr /usr/local/elasticsearch/bin/*.exe && \
    mkdir /var/lib/elasticsearch/data /var/lib/elasticsearch/plugins /var/lib/elasticsearch/tmp && \
    chown elasticsearch:elasticsearch /var/lib/elasticsearch/data /var/lib/elasticsearch/plugins \
        /var/lib/elasticsearch/tmp && \
    chown -R elasticsearch:elasticsearch /usr/local/elasticsearch/config && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9200 9300
VOLUME ["/var/lib/elasticsearch"]
