FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY packages/*.apk /root/
RUN tar xzf /root/zabbix-frontend-php-3.2.3-r0.apk -C / && \
    ln -s /usr/share/webapps/zabbix/ /var/www && \
    rm -f /root/*.apk

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
