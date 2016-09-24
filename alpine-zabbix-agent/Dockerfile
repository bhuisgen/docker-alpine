FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update netcat-openbsd && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted zabbix-agent zabbix-utils && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 10050
