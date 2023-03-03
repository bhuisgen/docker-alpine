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

ENV JETTY_HOME=/usr/local/jetty \
    JETTY_BASE=/var/lib/jetty \
    JETTY_MODULES=ext,plus,http,deploy

RUN mkdir -p /var/lib/archiva && \
    addgroup -S archiva && \
    adduser -S -D -g "" -G archiva -s /sbin/nologin -h /var/lib/archiva archiva && \
    chown archiva:archiva /var/lib/archiva && \
    chmod 700 /var/lib/archiva

ADD https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/11.0.14/jetty-home-11.0.14.tar.gz /tmp/jetty.tar.gz
ADD http://www-eu.apache.org/dist/archiva/2.2.9/binaries/apache-archiva-2.2.9.war /tmp/archiva.war

RUN apk add --update --no-cache --progress openjdk11-jre unzip && \
    mkdir ${JETTY_HOME} && \
    tar -xzf /tmp/jetty.tar.gz -C ${JETTY_HOME} --strip-components 1 && \
    rm /tmp/jetty.tar.gz && \
    rm -fr ${JETTY_HOME}/demo-base && \
    mkdir ${JETTY_BASE} && \
    chown archiva:archiva ${JETTY_BASE} && \
    cd ${JETTY_BASE} && \
    /command/s6-setuidgid archiva java -jar "${JETTY_HOME}/start.jar" --add-module=${JETTY_MODULES} && \
    unzip /tmp/archiva.war -d ${JETTY_BASE}/webapps/root && \
    rm /tmp/archiva.war && \
    cp ${JETTY_BASE}/webapps/root/WEB-INF/lib/derby-*.jar ${JETTY_BASE}/lib/ext && \
    chown -R archiva:archiva ${JETTY_BASE} && \
    mkdir /var/lib/archiva/conf /var/lib/archiva/data /var/lib/archiva/logs /var/lib/archiva/temp && \
    chown archiva:archiva /var/lib/archiva/conf /var/lib/archiva/data /var/lib/archiva/logs /var/lib/archiva/temp && \
    apk del unzip

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/var/lib/archiva"]
