FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV JETTY_VERSION=9.4.8.v20171121 \
    JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/var/lib/jetty \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir /var/lib/jetty && \
    addgroup -S jetty && \
    adduser -S -D -g "" -G jetty -s /bin/sh -h /var/lib/jetty jetty && \
    chown jetty:jetty /var/lib/jetty

RUN apk add --update openjdk8-jre && \
    mkdir ${JETTY_HOME} && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JETTY_VERSION}/jetty-distribution-${JETTY_VERSION}.tar.gz | tar -xzo -C ${JETTY_HOME} --strip-components 1 && \
    rm -fr ${JETTY_HOME}/demo-base && \
    cd ${JETTY_BASE} && \
    s6-setuidgid jetty java -jar "${JETTY_HOME}/start.jar" --add-to-start=${JETTY_MODULES} && \
    chown -R jetty:jetty ${JETTY_BASE} && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
