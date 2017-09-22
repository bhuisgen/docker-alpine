FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update openssh && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.6/community/ shadow && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home"]
