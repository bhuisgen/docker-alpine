ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-jetty" \
      org.label-schema.description="alpine-jetty image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV JETTY_VERSION=11.0.7 \
    JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/var/lib/jetty \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir /var/lib/jetty && \
    addgroup -S jetty && \
    adduser -S -D -g "" -G jetty -s /bin/sh -h /var/lib/jetty jetty && \
    chown jetty:jetty /var/lib/jetty

RUN apk add --update openjdk11-jre && \
    mkdir ${JETTY_HOME} && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/${JETTY_VERSION}/jetty-home-${JETTY_VERSION}.tar.gz | \
        tar -xzo -C ${JETTY_HOME} --strip-components 1 && \
    rm -fr ${JETTY_HOME}/demo-base && \
    cd ${JETTY_BASE} && \
    s6-setuidgid jetty java -jar "${JETTY_HOME}/start.jar" --add-to-start=${JETTY_MODULES} && \
    chown -R jetty:jetty ${JETTY_BASE} && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
