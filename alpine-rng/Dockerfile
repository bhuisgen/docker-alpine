FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update rng-tools && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

HEALTHCHECK CMD [ $(s6-svstat /var/run/s6/services/rng | grep -c "^up ") == "1" ] || exit 1
