FROM bhuisgen/alpine-base:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update git && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ nodejs nodejs-npm && \
    git clone --depth 1 --progress https://github.com/bhuisgen/zabbix-monitor.git /usr/local/zabbix-monitor && \
    cd /usr/local/zabbix-monitor && \
    cp app/scripts/config.js.dist app/scripts/config.js && \
    npm install && \
    npm run build && \
    mkdir -p /var/www && \
    cd /var/www && \
    cp -r /usr/local/zabbix-monitor/dist/* /var/www/ && \
    rm -rf /usr/local/zabbix-monitor && \
    npm cache clean && \
    apk del git nodejs nodejs-npm && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
