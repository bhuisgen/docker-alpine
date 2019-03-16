ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update python3 && \
    python3 -m ensurepip --upgrade && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
