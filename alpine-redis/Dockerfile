FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update redis && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 6379
