FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update rsyslog && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []

EXPOSE 514 514/udp
VOLUME ["/var/log"]
