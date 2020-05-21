ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-tomcat" \
      org.label-schema.description="alpine-tomcat image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV TOMCAT_MAJOR=9 \
    TOMCAT_VERSION=9.0.33 \
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
