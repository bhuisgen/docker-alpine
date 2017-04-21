FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV RSLSYNC_DATA=/var/lib/rslsync

RUN mkdir -p ${RSLSYNC_DATA} ${RSLSYNC_DATA}/root && \
    addgroup -S rslsync && \
    adduser -S -D -g "" -G rslsync -s /bin/sh -h ${RSLSYNC_DATA} rslsync && \
    chown -R rslsync:rslsync ${RSLSYNC_DATA} ${RSLSYNC_DATA}/root

RUN apk add --update libc6-compat && \
    curl -sSL https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar -xzo -C /usr/local/bin rslsync && \
    mkdir -p /lib64 && \
    ln /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888 55555
VOLUME ["/var/lib/rslsync"]
