FROM bhuisgen/alpine-base:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update git && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ nodejs yarn && \
    git clone --depth 1 https://github.com/bhuisgen/zabbix-monitor.git /usr/local/zabbix-monitor && \
    cd /usr/local/zabbix-monitor && \
    cp app/scripts/config.js.dist app/scripts/config.js && \
    yarn install && \
    yarn run build && \
    mkdir -p /var/www && \
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
