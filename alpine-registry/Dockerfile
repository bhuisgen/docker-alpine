FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN mkdir -p /var/lib/registry && \
    addgroup registry && \
    adduser -S -D -g "" -G registry -s /bin/sh -h /var/lib/registry registry

RUN apk add --update docker-registry && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5000
VOLUME ["/var/lib/registry"]
