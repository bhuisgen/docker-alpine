FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update docker git openssh-client && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/usr/local/build/run.sh"]
CMD []

WORKDIR /usr/local/build
