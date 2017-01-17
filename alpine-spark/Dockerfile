FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV SPARK_VERSION=2.1.0 \
    HADOOP_VERSION=2.7 \
    SPARK_HOME=/usr/local/spark

RUN mkdir -p ${SPARK_HOME} && \
    addgroup -S spark && \
    adduser -S -D -g "" -G spark -s /bin/sh -h ${SPARK_HOME} spark && \
    chown -R spark:spark ${SPARK_HOME}

RUN apk add --update openjdk8-jre tar && \
    curl -sSL http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz | tar -xzo -C ${SPARK_HOME} --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
