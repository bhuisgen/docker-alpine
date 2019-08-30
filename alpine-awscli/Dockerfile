FROM alpine:3.9
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update python3 && \
    python3 -m ensurepip --upgrade && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/aws"]
CMD []

VOLUME ["/data"]
WORKDIR /data
