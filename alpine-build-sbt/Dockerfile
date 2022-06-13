ARG BASE
ARG TAG

FROM bhuisgen/alpine-build:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-build-sbt" \
    org.label-schema.description="alpine-build-sbt image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/sbt/sbt/releases/download/v1.6.2/sbt-1.6.2.tgz /tmp/sbt.tgz

RUN apk add --update --no-cache --progress openjdk11-jre tar && \
    mkdir /usr/local/sbt && \
    tar -xzf /tmp/sbt.tgz -C /usr/local/sbt --strip-components 1 && \
    rm /tmp/sbt.tgz && \
    apk del tar

ENTRYPOINT ["/init"]
CMD []
