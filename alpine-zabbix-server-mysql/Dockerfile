FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ZABBIX_VERSION=3.2.4

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-server-mysql-${ZABBIX_VERSION}-*.apk && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10051
VOLUME ["/var/lib/zabbix"]
