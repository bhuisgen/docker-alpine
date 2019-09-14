ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update openssl unbound && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 53 53/udp
