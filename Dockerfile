FROM alpine:3.6
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JENKINS_HOME=/home/jenkins

RUN apk add --update build-base && \
    rm -rf /var/cache/apk/*

RUN mkdir -p ${JENKINS_HOME} && \
    addgroup -S jenkins && \
    adduser -S -D -g "" -G jenkins -s /bin/sh -h ${JENKINS_HOME} jenkins && \
    chown -R jenkins:jenkins ${JENKINS_HOME}

USER jenkins
