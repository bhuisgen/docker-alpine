FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-server-pgsql-3.2.3-r0.apk && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10051
