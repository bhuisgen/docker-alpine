FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/docker-registry-2.6.2-r0.apk && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5000
VOLUME ["/var/lib/docker-registry"]
