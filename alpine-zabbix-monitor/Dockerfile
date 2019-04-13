FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

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
