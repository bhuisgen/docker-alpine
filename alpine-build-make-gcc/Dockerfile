FROM bhuisgen/alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update gcc && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/build/run.sh"]
CMD [""]

WORKDIR /usr/local/build
