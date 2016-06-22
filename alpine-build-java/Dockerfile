FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:${JAVA_HOME}/bin

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update git maven@testing openjdk8 openssh-client && \
    mkdir -p /usr/local/build && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/usr/local/build/run.sh"]
CMD []
