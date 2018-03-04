FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ZABBIX_VERSION=3.4.4

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-java-gateway-${ZABBIX_VERSION}-*.apk && \
    mkdir /usr/share/zabbix/zabbix_java/conf && \
    chown -R zabbix:zabbix /usr/share/zabbix/zabbix_java/conf && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10052 8090
VOLUME ["/var/lib/zabbix"]
