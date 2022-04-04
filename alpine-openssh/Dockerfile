ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN apk add --update openssh shadow && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home"]
