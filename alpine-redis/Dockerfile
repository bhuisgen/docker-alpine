ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN apk add --update redis && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 6379
VOLUME ["/var/lib/redis"]
