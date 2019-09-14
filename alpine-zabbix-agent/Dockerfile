ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ZABBIX_VERSION=3.4.7 \
    ZABBIXDOCKER_VERSION=0.3.1

COPY packages/*.apk /root/
RUN apk add --update git python3 && \
    apk add --allow-untrusted \
        /root/zabbix-agent-${ZABBIX_VERSION}-*.apk && \
    python3 -m ensurepip --upgrade && \
    git clone -b ${ZABBIXDOCKER_VERSION} https://github.com/bhuisgen/zabbix-docker.git /tmp/zabbix-docker && \
    cd /tmp/zabbix-docker && \
    python3 setup.py install && \
    rm -fr /tmp/zabbix-docker && \
    apk del git && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10050
VOLUME ["/var/lib/zabbix"]
