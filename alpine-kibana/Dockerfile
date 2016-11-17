FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV KIBANA_VERSION=4.5.1

RUN mkdir -p /var/lib/kibana && \
    addgroup -S kibana && \
    adduser -S -D -g "" -G kibana -s /sbin/nologin -h /var/lib/kibana kibana && \
    chown -R kibana:kibana /var/lib/kibana

RUN apk add --update tar && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted nodejs && \
    mkdir -p /usr/local/kibana && \
    curl -sSL https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz | tar -xzo -C /usr/local/kibana --strip-components 1 && \
    rm -rf /usr/share/kibana/node && \
    mkdir -p /usr/share/kibana/node/bin && \
    ln -sf /usr/bin/node /usr/local/kibana/node/bin/node && \
    rm -fr /usr/local/kibana/bin/*.bat && \
    chown -R kibana:kibana /usr/local/kibana && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5601
