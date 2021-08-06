#! /bin/bash

VERSION=`cat ./VERSION`

MAJOR_MINOR_VERSION=`echo ${VERSION} | cut -f 1-2 -d '.'`
RELEASE_VERSION=`echo ${VERSION} | cut -f 3 -d '.'`

docker build \
	--build-arg MAJOR_MINOR_VERSION=${MAJOR_MINOR_VERSION} \
        --build-arg RELEASE_VERSION=${RELEASE_VERSION} \
	-t tkomagata/alpine-armhf:${VERSION} .
docker push tkomagata/alpine-armhf:${VERSION}
