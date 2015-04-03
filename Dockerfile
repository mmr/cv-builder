FROM ubuntu:trusty
MAINTAINER Marcio Ribeiro <binary@b1n.org>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy \
        make xsltproc \
        texlive-latex-base \
        texlive-lang-portuguese \
        texlive-fonts-recommended

ADD http://mirrors.ctan.org/macros/latex/contrib/url.zip \
    /usr/share/texlive/texmf-dist/tex/latex

WORKDIR /data
VOLUME ["/data"]
