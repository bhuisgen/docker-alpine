ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV KIBANA_VERSION=6.2.1

RUN mkdir /var/lib/kibana && \
    addgroup -S kibana && \
    adduser -S -D -g "" -G kibana -s /sbin/nologin -h /var/lib/kibana kibana && \
    chown kibana:kibana /var/lib/kibana

RUN apk add --update nodejs tar && \
    mkdir /usr/local/kibana && \
    curl -sSL https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz | \
        tar -xzo -C /usr/local/kibana --strip-components 1 && \
    ln -sf /usr/bin/node /usr/local/kibana/node/bin/node && \
    rm -fr /usr/local/kibana/bin/*.bat && \
    chown -R kibana:kibana /usr/local/kibana && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5601
