FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/zabbix-agent-docker-3.2.1-r0.apk \
        /root/zabbix-sender-3.2.1-r0.apk && \
    apk add --update netcat-openbsd && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk && \

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10050
