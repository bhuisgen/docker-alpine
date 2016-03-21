FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JETTY_MAJOR="stable-9" \
    JETTY_VERSION="9.3.8.v20160314"

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/jetty && \
    cd /usr/local/jetty && \
    curl -sSL http://download.eclipse.org/jetty/${JETTY_MAJOR}/dist/jetty-distribution-${JETTY_VERSION}.tar.gz -o jetty.tar.gz && \
    tar xf jetty.tar.gz --strip-components=1 && \
    rm jetty.tar.gz* && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
