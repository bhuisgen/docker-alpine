ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-archiva" \
      org.label-schema.description="alpine-archiva image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV ARCHIVA_VERSION=2.2.7 \
    JETTY_VERSION=11.0.9 \
    JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/var/lib/jetty \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir -p /var/lib/archiva && \
    addgroup -S archiva && \
    adduser -S -D -g "" -G archiva -s /bin/sh -h /var/lib/archiva archiva && \
    chown archiva:archiva /var/lib/archiva

RUN apk add --update openjdk11-jre unzip && \
    mkdir ${JETTY_HOME} && \
    curl -sSL https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/${JETTY_VERSION}/jetty-home-${JETTY_VERSION}.tar.gz | \
        tar -xzo -C ${JETTY_HOME} --strip-components 1 && \
    rm -fr ${JETTY_HOME}/demo-base && \
    mkdir ${JETTY_BASE} && \
    chown archiva:archiva ${JETTY_BASE} && \
    cd ${JETTY_BASE} && \
    s6-setuidgid archiva java -jar "${JETTY_HOME}/start.jar" --add-module=${JETTY_MODULES} && \
    curl -sSL http://www-eu.apache.org/dist/archiva/${ARCHIVA_VERSION}/binaries/apache-archiva-${ARCHIVA_VERSION}.war \
        -o /tmp/archiva.war && \
    unzip /tmp/archiva.war -d ${JETTY_BASE}/webapps/root && \
    rm /tmp/archiva.war && \
    cp ${JETTY_BASE}/webapps/root/WEB-INF/lib/derby-*.jar ${JETTY_BASE}/lib/ext && \
    chown -R archiva:archiva ${JETTY_BASE} && \
    mkdir /var/lib/archiva/conf /var/lib/archiva/data /var/lib/archiva/logs /var/lib/archiva/temp && \
    chown archiva:archiva /var/lib/archiva/conf /var/lib/archiva/data /var/lib/archiva/logs /var/lib/archiva/temp && \
    apk del unzip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/var/lib/archiva"]
