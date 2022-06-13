ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-jenkins" \
    org.label-schema.description="alpine-jenkins image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV JENKINS_HOME=/home/jenkins

RUN mkdir ${JENKINS_HOME} && \
    addgroup -S jenkins && \
    adduser -S -D -g "" -G jenkins -s /bin/sh -h ${JENKINS_HOME} jenkins && \
    chown jenkins:jenkins ${JENKINS_HOME} && \
    chmod 700 ${JENKINS_HOME}

ADD http://mirrors.jenkins-ci.org/war-stable/2.332.3/jenkins.war /tmp/jenkins.war

RUN apk add --update --no-cache --progress git openjdk11-jre openssh-client ttf-dejavu && \
    mkdir /usr/local/jenkins && \
    mv /tmp/jenkins.war /usr/local/jenkins/jenkins.war

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/home/jenkins"]
