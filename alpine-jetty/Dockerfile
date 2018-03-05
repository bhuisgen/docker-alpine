FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV JETTY_VERSION=9.4.8.v20171121 \
    JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/usr/local/jetty-base \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir ${JETTY_BASE} && \
    addgroup -S jetty && \
    adduser -S -D -g "" -G jetty -s /bin/sh -h ${JETTY_BASE} jetty && \
    chown jetty:jetty ${JETTY_BASE}

RUN apk add --update openjdk8-jre && \
    mkdir ${JETTY_HOME} && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JETTY_VERSION}/jetty-distribution-${JETTY_VERSION}.tar.gz | tar -xzo -C ${JETTY_HOME} --strip-components 1 && \
    rm -fr ${JETTY_HOME}/demo-base && \
    cd ${JETTY_BASE} && \
    java -jar "${JETTY_HOME}/start.jar" --add-to-start=${JETTY_MODULES} && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
