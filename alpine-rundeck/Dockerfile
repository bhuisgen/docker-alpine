ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

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

ENV RUNDECK_VERSION=3.4.10-20220118 \
    RDECK_BASE=/home/rundeck \
    PATH=${PATH}:${RDECK_BASE}/tools/bin

RUN addgroup -S rundeck && \
    adduser -S -D -g "" -G rundeck -s /bin/sh -h ${RDECK_BASE} rundeck && \
    chown rundeck:rundeck ${RDECK_BASE}

RUN apk add --update openjdk11-jre openssh-client && \
    cd ${RDECK_BASE} && \
    curl -sSL https://packagecloud.io/pagerduty/rundeck/packages/java/org.rundeck/rundeck-${RUNDECK_VERSION}.war/artifacts/rundeck-${RUNDECK_VERSION}.war/download -o rundeck.war && \
    s6-setuidgid rundeck java -jar rundeck.war --installonly && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4440 4443
VOLUME ["/home/rundeck"]
