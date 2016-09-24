FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JENKINS_VERSION=2.7.4 \
    JENKINS_HOME=/home/jenkins

RUN mkdir -p /home/jenkins && \
    addgroup jenkins && \
    adduser -D -g "" -G jenkins -s /bin/sh -h /home/jenkins jenkins && \
    chown -R jenkins:jenkins /home/jenkins

RUN apk add --update git openjdk8-jre openssh-client ttf-dejavu && \
    mkdir -p /usr/local/jenkins && \
    curl -sSL http://mirrors.jenkins-ci.org/war-stable/${JENKINS_VERSION}/jenkins.war -o /usr/local/jenkins/jenkins.war && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/home/jenkins"]
