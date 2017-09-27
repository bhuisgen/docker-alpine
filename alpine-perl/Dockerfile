FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update perl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
