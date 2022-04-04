ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-elasticsearch" \
      org.label-schema.description="alpine-elasticsearch image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV ELASTICSEARCH_VERSION=7.15.2

RUN mkdir /var/lib/elasticsearch && \
    addgroup -S elasticsearch && \
    adduser -S -D -g "" -G elasticsearch -s /sbin/nologin -h /var/lib/elasticsearch elasticsearch && \
    chown elasticsearch:elasticsearch /var/lib/elasticsearch

RUN apk add --update openjdk11-jre tar && \
    mkdir /usr/local/elasticsearch && \
    curl -sSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}-linux-x86_64.tar.gz | \
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
