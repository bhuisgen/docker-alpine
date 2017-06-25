FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.0.44

RUN apk add --update openjdk8-jre tar && \
    mkdir -p /usr/local/tomcat && \
    curl -sSL http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz | tar -xzo -C /usr/local/tomcat --strip-components 1 && \
    rm -fr /usr/local/tomcat/bin/*.bat /usr/local/tomcat/webapps/* && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080 8090 8000
