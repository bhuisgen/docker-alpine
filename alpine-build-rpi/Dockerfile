ARG TAG

FROM bhuisgen/alpine-build:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

COPY rootfs/ /

ENTRYPOINT [ "/usr/bin/qemu-arm-static", "-execve", "/bin/sh", "/usr/local/build/run.sh" ]
CMD []

WORKDIR /usr/local/build
