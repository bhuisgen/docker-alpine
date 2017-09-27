FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update xvfb && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
