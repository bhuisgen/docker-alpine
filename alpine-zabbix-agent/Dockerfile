FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ZABBIX_VERSION=3.2.4

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        git python3 \
        /root/zabbix-agent-${ZABBIX_VERSION}-*.apk && \
    python3 -m ensurepip --upgrade && \
    git clone --depth 1 --progress https://github.com/bhuisgen/zabbix-docker.git /usr/local/zabbix-docker && \
    cd /usr/local/zabbix-docker && \
    python3 setup.py install && \
    apk del git && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10050
VOLUME ["/var/lib/zabbix"]
