FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update \
        python \
        py-pip && \
    pip install awscli && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["aws"]
CMD []

VOLUME ["/data"]
WORKDIR /data
