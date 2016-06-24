FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN sed -i -e 's/v3\.3/edge/g' /etc/apk/repositories && \
    apk add --update git nodejs openssh-client && \
    mkdir -p /usr/local/build && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []
