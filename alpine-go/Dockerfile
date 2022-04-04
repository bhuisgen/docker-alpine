ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update go && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
