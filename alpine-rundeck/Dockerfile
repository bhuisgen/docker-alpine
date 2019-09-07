ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV RUNDECK_VERSION=3.1.0-20190731 \
    RDECK_BASE=/home/rundeck \
    PATH=${PATH}:${RDECK_BASE}/tools/bin

RUN addgroup -S rundeck && \
    adduser -S -D -g "" -G rundeck -s /bin/sh -h ${RDECK_BASE} rundeck && \
    chown rundeck:rundeck ${RDECK_BASE}

RUN apk add --update openjdk8-jre openssh-client && \
    cd ${RDECK_BASE} && \
    curl -sSL http://dl.bintray.com/rundeck/rundeck-maven/rundeck-${RUNDECK_VERSION}.war -o rundeck.war && \
    s6-setuidgid rundeck java -jar rundeck.war --installonly && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4440 4443
VOLUME ["/home/rundeck"]
