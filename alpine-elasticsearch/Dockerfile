FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ELASTICSEARCH_VERSION=2.3.3

RUN mkdir /var/lib/elasticsearch && \
    addgroup -S elasticsearch && \
    adduser -S -D -g "" -G elasticsearch -s /sbin/nologin -h /var/lib/elasticsearch elasticsearch && \
    chown elasticsearch:elasticsearch /var/lib/elasticsearch

RUN apk add --update openjdk8-jre tar && \
    curl -sSL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ELASTICSEARCH_VERSION}/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz | tar -xzo -C /usr/local/elasticsearch --strip-components 1 && \
    mkdir /usr/local/elasticsearch && \
    rm -fr /usr/local/elasticsearch/bin/*.exe && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9200 9300
VOLUME ["/var/lib/elasticsearch"]
