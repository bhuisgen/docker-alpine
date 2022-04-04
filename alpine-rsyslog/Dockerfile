ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN apk add --update rsyslog && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []

EXPOSE 514 514/udp
VOLUME ["/var/log"]
