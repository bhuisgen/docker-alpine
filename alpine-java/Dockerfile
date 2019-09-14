ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update openjdk8-jre && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
