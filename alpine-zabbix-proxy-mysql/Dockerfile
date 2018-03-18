FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ZABBIX_VERSION=3.4.4

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-${ZABBIX_VERSION}-*.apk \
        /root/zabbix-proxy-mysql-${ZABBIX_VERSION}-*.apk \
        /root/zabbix-setup-${ZABBIX_VERSION}-*.apk && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10051
VOLUME ["/var/lib/zabbix"]
