FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update libc6-compat && \
    curl -sSL https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar -xzo -C /usr/local/bin rslsync && \
    mkdir -p /var/lib/rslsync && \
    mkdir -p /lib64 && \
    ln /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888 55555
VOLUME ["/var/lib/rslsync", "/data"]
