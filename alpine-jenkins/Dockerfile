FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JENKINS_VERSION=2.32.2 \
    JENKINS_HOME=/home/jenkins

RUN mkdir -p ${JENKINS_HOME} && \
    addgroup -S jenkins && \
    adduser -S -D -g "" -G jenkins -s /bin/sh -h ${JENKINS_HOME} jenkins && \
    chown -R jenkins:jenkins ${JENKINS_HOME}

RUN apk add --update git openjdk8-jre openssh-client ttf-dejavu && \
    mkdir -p /usr/local/jenkins && \
    curl -sSL http://mirrors.jenkins-ci.org/war-stable/${JENKINS_VERSION}/jenkins.war -o /usr/local/jenkins/jenkins.war && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/home/jenkins"]
