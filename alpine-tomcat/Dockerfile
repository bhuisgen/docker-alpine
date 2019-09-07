ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV TOMCAT_MAJOR=9 \
    TOMCAT_VERSION=9.0.24 \
    CATALINA_HOME=/usr/local/tomcat

RUN mkdir /var/lib/tomcat && \
    addgroup -S tomcat && \
    adduser -S -D -g "" -G tomcat -s /bin/sh -h /var/lib/tomcat tomcat && \
    chown tomcat:tomcat /var/lib/tomcat

RUN apk add --update openjdk8-jre tar && \
    mkdir /usr/local/tomcat && \
    curl -sSL http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz | \
        tar -xzo -C /usr/local/tomcat --strip-components 1 && \
    rm -fr /usr/local/tomcat/bin/*.bat /usr/local/tomcat/webapps/* /usr/local/tomcat/work/Catalina/localhost/* \
        /usr/local/tomcat/conf/Catalina/localhost/* && \
    chown -R tomcat:tomcat /usr/local/tomcat && \
    chmod 700 /usr/local/tomcat/conf && \
    chmod -R 400 /usr/local/tomcat/conf/* && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
