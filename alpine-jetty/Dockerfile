FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JETTY_MAJOR=stable-9 \
    JETTY_VERSION=9.3.9.v20160517

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/jetty && \
    curl -sSL http://download.eclipse.org/jetty/${JETTY_MAJOR}/dist/jetty-distribution-${JETTY_VERSION}.tar.gz | tar -xzo -C /usr/local/jetty --strip-components 1 && \
    rm -fr demo-base \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
