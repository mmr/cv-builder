#!/bin/bash
exec docker run \
    --rm -i --user="$(id -u):$(id -g)" \
    -v $PWD:/data \
    mribeiro/cv-builder \
    make -f ${1:-Makefile}
