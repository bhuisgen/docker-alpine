FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ZABBIX_VERSION=3.2.4

COPY packages/*.apk /root/
RUN tar xzf /root/zabbix-frontend-php-${ZABBIX_VERSION}-*.apk -C / && \
    ln -s /usr/share/webapps/zabbix/ /var/www && \
    rm -f /root/*.apk

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
