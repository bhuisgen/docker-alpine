FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        python3 \
        /root/zabbix-agent-3.2.1-r0.apk \
        /root/zabbix-sender-3.2.1-r0.apk && \
    python3 -m ensurepip --upgrade && \
    pip3 install docker-py py-zabbix && \
    rm -rf /var/cache/apk/* && \
    rm -f /root/*.apk

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10050
