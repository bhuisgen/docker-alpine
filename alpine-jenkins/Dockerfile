FROM bhuisgen/alpine-tomcat:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JENKINS_HOME=/home/jenkins \
    CATALINA_OPTS="-DJENKINS_HOME=/home/jenkins/"

RUN mkdir -p /home/jenkins && \
    addgroup jenkins && \
    adduser -D -g "" -G jenkins -s /bin/sh -h /home/jenkins jenkins && \
    chown -R jenkins:jenkins /home/jenkins

RUN apk add --update git openssh-client ttf-dejavu && \
    curl -sSL http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war -o /usr/local/tomcat/webapps/ROOT.war && \
    rm -rf /var/cache/apk/*

VOLUME ["/home/jenkins"]
