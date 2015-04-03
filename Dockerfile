FROM ubuntu:trusty
MAINTAINER Marcio Ribeiro <binary@b1n.org>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy \
        make xsltproc \
        texlive-latex-base \
        texlive-lang-portuguese \
        texlive-fonts-recommended

# Installing url extension
RUN apt-get install -qy unzip
COPY url.zip /tmp/url.zip
RUN unzip /tmp/url.zip -d /usr/share/texlive/texmf-dist/tex/latex

# Updating texmf after installing url extension
RUN texhash

WORKDIR /data
VOLUME ["/data"]
