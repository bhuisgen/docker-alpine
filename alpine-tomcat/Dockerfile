FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV TOMCAT_MAJOR="8" \
    TOMCAT_VERSION="8.0.32"

RUN apk add --update curl openjdk8-jre tar && \
    mkdir -p /usr/local/tomcat && \
    cd /usr/local/tomcat && \
    curl -sSL https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -o tomcat.tar.gz && \
    tar xf tomcat.tar.gz --strip-components=1 && \
    rm tomcat.tar.gz* && \
    rm bin/*.bat && \
    rm -rf /usr/local/tomcat/webapps/* && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
