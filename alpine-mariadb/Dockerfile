ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-mariadb" \
    org.label-schema.description="alpine-mariadb image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION"

RUN apk add --update --no-cache --progress mariadb mariadb-common mariadb-client && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:root /var/run/mysqld

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 3306
VOLUME ["/var/lib/mysql"]
