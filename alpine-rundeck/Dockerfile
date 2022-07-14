ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-rundeck" \
    org.label-schema.description="alpine-rundeck image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV RDECK_BASE=/home/rundeck \
    PATH=${PATH}:${RDECK_BASE}/tools/bin

RUN addgroup -S rundeck && \
    adduser -S -D -g "" -G rundeck -s /bin/sh/nologin -h ${RDECK_BASE} rundeck && \
    chown rundeck:rundeck ${RDECK_BASE} && \
    chmod 700 ${RDECK_BASE}

ADD https://packagecloud.io/pagerduty/rundeck/packages/java/org.rundeck/rundeck-4.3.0-20220602.war/artifacts/rundeck-4.3.0-20220602.war/download \
        /tmp/rundeck.war

RUN apk add --update --no-cache --progress openjdk11-jre openssh-client && \
    mv /tmp/rundeck.war ${RDECK_BASE} && \
    chown rundeck:rundeck ${RDECK_BASE}/rundeck.war && \
    cd ${RDECK_BASE} && \
    /command/s6-setuidgid rundeck java -jar rundeck.war --installonly

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4440 4443
VOLUME ["/home/rundeck"]
