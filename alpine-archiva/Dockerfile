FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ARCHIVA_VERSION=2.2.1 \
    ARCHIVA_BASE=/var/lib/archiva \
    JETTY_VERSION=9.4.2.v20170220 \
    JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/usr/local/jetty-base \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir -p ${ARCHIVA_BASE}/conf ${ARCHIVA_BASE}/data ${ARCHIVA_BASE}/logs ${ARCHIVA_BASE}/temp && \
    addgroup -S archiva && \
    adduser -S -D -g "" -G archiva -s /bin/sh -h ${ARCHIVA_BASE} archiva && \
    chown -R archiva:archiva ${ARCHIVA_BASE}

RUN apk add --update openjdk8-jre unzip && \
    mkdir -p ${JETTY_HOME} ${JETTY_BASE} && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JETTY_VERSION}/jetty-distribution-${JETTY_VERSION}.tar.gz | tar -xzo -C ${JETTY_HOME} --strip-components 1 && \
    rm -fr ${JETTY_HOME}/demo-base && \
    cd ${JETTY_BASE} && \
    java -jar "${JETTY_HOME}/start.jar" --add-to-start=${JETTY_MODULES} && \
    curl -sSL http://www-eu.apache.org/dist/archiva/${ARCHIVA_VERSION}/binaries/apache-archiva-${ARCHIVA_VERSION}.war -o /tmp/archiva.war && \
    unzip /tmp/archiva.war -d ${JETTY_BASE}/webapps/root && \
    rm /tmp/archiva.war && \
    cp ${JETTY_BASE}/webapps/root/WEB-INF/lib/derby-*.jar ${JETTY_BASE}/lib/ext && \
    apk del unzip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/var/lib/archiva"]
