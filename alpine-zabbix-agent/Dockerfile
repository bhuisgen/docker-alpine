FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        git python3 \
        /root/zabbix-agent-3.2.3-r0.apk && \
    python3 -m ensurepip --upgrade && \
    git clone --progress https://github.com/bhuisgen/zabbix-docker.git /usr/local/zabbix-docker && \
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
