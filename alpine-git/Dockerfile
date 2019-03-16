ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN mkdir /home/git && \
    addgroup git && \
    adduser -D -g "" -G git -s /usr/bin/git-shell -h /home/git git && \
    echo git:* | chpasswd && \
    chown git:git /home/git && \
    mkdir /home/git/git-shell-commands && \
    chmod 755 /home/git/git-shell-commands

RUN apk add --update git openssh && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home/git"]
