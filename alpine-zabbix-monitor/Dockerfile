FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-zabbix-monitor" \
      org.label-schema.description="alpine-zabbix-monitor image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV ZABBIXMONITOR_VERSION=0.4.0

RUN apk add --update git nodejs yarn && \
    git clone -b ${ZABBIXMONITOR_VERSION} https://github.com/bhuisgen/zabbix-monitor.git /usr/local/zabbix-monitor && \
    cd /usr/local/zabbix-monitor && \
    cp app/scripts/config.js.dist app/scripts/config.js && \
    yarn install && \
    yarn run build && \
    mkdir /var/www && \
    cd /var/www && \
    cp -r /usr/local/zabbix-monitor/dist/* /var/www/ && \
    rm -rf /usr/local/zabbix-monitor && \
    yarn cache clean && \
    apk del git nodejs yarn && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
