FROM alpine:latest as base

ARG MAJOR_MINOR_VERSION
ARG RELEASE_VERSION
ARG ARCH=armhf

RUN mkdir /alpine

ADD https://dl-cdn.alpinelinux.org/alpine/v$MAJOR_MINOR_VERSION/releases/$ARCH/alpine-minirootfs-$MAJOR_MINOR_VERSION.$RELEASE_VERSION-$ARCH.tar.gz .

RUN tar xf alpine-minirootfs-$MAJOR_MINOR_VERSION.$RELEASE_VERSION-$ARCH.tar.gz -C /alpine

FROM scratch
COPY --from=base  /alpine /
CMD ["/bin/sh"]
