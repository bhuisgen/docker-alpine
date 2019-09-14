ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update ruby ruby-irb ruby-rdoc && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
