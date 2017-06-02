FROM bhuisgen/rpi-alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

COPY rootfs/ /

RUN /bin/echo 'Hello from ARM container'

RUN echo "/bin/echo 'Hello from ARM container'" > /test.sh && chmod +x /test.sh

ENTRYPOINT [ "/usr/bin/qemu-arm-static", "-execve", "/bin/sh", "/usr/local/build/run.sh" ]
CMD []

WORKDIR /usr/local/build
