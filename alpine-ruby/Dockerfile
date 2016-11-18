FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update ruby ruby-irb ruby-rdoc && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
