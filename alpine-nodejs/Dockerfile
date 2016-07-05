FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN sed -i -e 's/\/v.\+\//\/edge\//g' /etc/apk/repositories && \
    apk add --update nodejs && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
