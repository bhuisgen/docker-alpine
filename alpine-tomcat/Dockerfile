ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

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

ENV CATALINA_HOME=/usr/local/tomcat

RUN mkdir /var/lib/tomcat && \
    addgroup -S tomcat && \
    adduser -S -D -g "" -G tomcat -s /sbin/nologin -h /var/lib/tomcat tomcat && \
    chown tomcat:tomcat /var/lib/tomcat

ADD http://archive.apache.org/dist/tomcat/tomcat-10/v10.0.22/bin/apache-tomcat-10.0.22.tar.gz /tmp/tomcat.tar.gz

RUN apk add --update --no-cache --progress openjdk11-jre tar && \
    mkdir /usr/local/tomcat && \
    tar -xzf /tmp/tomcat.tar.gz -C /usr/local/tomcat --strip-components 1 && \
    rm /tmp/tomcat.tar.gz && \
    rm -fr /usr/local/tomcat/bin/*.bat /usr/local/tomcat/webapps/* /usr/local/tomcat/work/Catalina/localhost/* \
    /usr/local/tomcat/conf/Catalina/localhost/* && \
    chown -R tomcat:tomcat /usr/local/tomcat && \
    chmod 700 /usr/local/tomcat/conf && \
    chmod -R 400 /usr/local/tomcat/conf/* && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
