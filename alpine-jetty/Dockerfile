FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JETTY_MAJOR="stable-9" \
    JETTY_VERSION="9.3.7.v20160115"

RUN apk add --update curl openjdk8-jre tar && \
    mkdir -p /usr/local/jetty && \
    cd /usr/local/jetty && \
    curl -sSL http://download.eclipse.org/jetty/${JETTY_MAJOR}/dist/jetty-distribution-${JETTY_VERSION}.tar.gz -o jetty.tar.gz && \
    tar xf jetty.tar.gz --strip-components=1 && \
    rm jetty.tar.gz* && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
