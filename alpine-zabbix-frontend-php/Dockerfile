FROM bhuisgen/alpine-base:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ZABBIX_VERSION=3.4.4

COPY packages/*.apk /root/
RUN tar xzf /root/zabbix-frontend-php-${ZABBIX_VERSION}-*.apk -C / && \
    ln -s /usr/share/webapps/zabbix/ /var/www && \
    rm -f /root/*.apk

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
