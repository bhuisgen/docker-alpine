ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV ZABBIX_VERSION=3.4.7

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-${ZABBIX_VERSION}-*.apk \
        /root/zabbix-server-pgsql-${ZABBIX_VERSION}-*.apk \
        /root/zabbix-setup-${ZABBIX_VERSION}-*.apk && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10051
VOLUME ["/var/lib/zabbix"]
