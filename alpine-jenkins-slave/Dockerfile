ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV JENKINS_HOME=/home/jenkins

RUN mkdir ${JENKINS_HOME} && \
    addgroup -S jenkins && \
    adduser -S -D -g "" -G jenkins -s /bin/sh -h ${JENKINS_HOME} jenkins && \
    chown jenkins:jenkins ${JENKINS_HOME}

RUN apk add --no-cache --update git docker openjdk11-jre openssh

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home/jenkins"]
