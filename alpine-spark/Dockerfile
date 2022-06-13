ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-spark" \
    org.label-schema.description="alpine-spark image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV SPARK_HOME=/usr/local/spark

RUN mkdir ${SPARK_HOME} && \
    addgroup -S spark && \
    adduser -S -D -g "" -G spark -s /bin/sh -h ${SPARK_HOME} spark && \
    chown spark:spark ${SPARK_HOME}

ADD http://apache.mirrors.ovh.net/ftp.apache.org/dist/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz /tmp/spark-hadoop.tgz

RUN apk add --update --no-cache --progress openjdk11-jre tar && \
    tar -xzf /tmp/spark-hadoop.tgz -C ${SPARK_HOME} --strip-components 1 && \
    rm /tmp/spark-hadoop.tgz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
