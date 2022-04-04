ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

COPY packages/*.apk /root/
RUN apk add --update --allow-untrusted \
        /root/opendmarc-*.apk && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8893
