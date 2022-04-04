ARG BASE
ARG TAG

FROM bhuisgen/alpine-build:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV SBT_VERSION=1.3.13

RUN apk add --update openjdk11-jre tar && \
    mkdir /usr/local/sbt && \
    curl -sSL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | \
        tar -xzo -C /usr/local/sbt --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
