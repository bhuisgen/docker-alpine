FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN mkdir -p /var/www && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -S -D -g "" -G www-data www-data

RUN apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/main/ autoconf automake build-base git nodejs nodejs-npm && \
    git clone --progress https://github.com/bhuisgen/zabbix-monitor.git /usr/local/zabbix-monitor && \
    cd /usr/local/zabbix-monitor && \
    cp app/scripts/config.js.dist app/scripts/config.js && \
    npm install && \
    npm run build && \
    mv dist /var/www && \
    chown -R www-data:www-data /var/www && \
    cd /var/www && \
    rm -rf /usr/local/zabbix-monitor && \
    npm cache clean && \
    apk del autoconf automake build-base git nodejs nodejs-npm && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
