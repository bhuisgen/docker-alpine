FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN mkdir -p /var/lib/registry && \
    addgroup -S registry && \
    adduser -S -D -g "" -G registry -s /bin/sh -h /var/lib/registry registry && \
    chown -R registry:registry /var/lib/registry

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/docker-registry-2.6.0-r0.apk && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5000
VOLUME ["/var/lib/registry"]
