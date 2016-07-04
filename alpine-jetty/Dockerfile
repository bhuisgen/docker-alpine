FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JETTY_VERSION=9.3.10.v20160621

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/jetty && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JETTY_VERSION}/jetty-distribution-${JETTY_VERSION}.tar.gz | tar -xzo -C /usr/local/jetty --strip-components 1 && \
    rm -fr /usr/local/jetty/demo-base \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
