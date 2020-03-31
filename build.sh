#!/usr/bin/env bash
set -xe

VERSION=${VERSION:-$(yarn info cypress version | tail -n2 | head -n1)}

build() {
    docker build . -t trevonerd/cypress:${VERSION} --build-arg VERSION=${VERSION}
    docker push trevonerd/cypress:${VERSION}
    docker tag trevonerd/cypress:${VERSION} trevonerd/cypress:latest
    docker push trevonerd/cypress:latest
}

docker pull trevonerd/cypress:${VERSION} || build
