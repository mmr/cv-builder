#
# Marcio Ribeiro <binary (a) b1n.org>
# Started: Fri Oct 29 21:15:31 BRST 2004
# $Id: Makefile,v 1.14 2006/10/17 01:42:47 mmr Exp $
#

# Needed external commands
XSLT ?= /usr/bin/xsltproc
LATEX ?= /usr/bin/latex
DVIPS ?= /usr/bin/dvips
PDFLATEX ?= /usr/bin/pdflatex

# Constants
CONTAINER_NS = mribeiro
CONTAINER_REPO = cv-builder
NAME = cv-builder
UID = $(id -u)
GID = $(id -g)

NAME = $(CV)
XML_INPUT = $(NAME).xml
PDF_OUTPUT = $(NAME).pdf
HTML_OUTPUT = $(NAME).html
TEX_OUTPUT = $(NAME).tex
DVI_OUTPUT = $(NAME).dvi
PS_OUTPUT = $(NAME).ps

TRANSFORMERS_DIR = transformers
LATEX_TRANSFORMER = $(TRANSFORMERS_DIR)/tex/tex.xls
HTML_TRANSFORMER = $(TRANSFORMERS_DIR)/html/html.xls

all: pdf ps html clean

build-image:
	docker build -t $(CONTAINER_NS)/$(CONTAINER_REPO) image

build:
	docker run \
		--rm -i --user=$(UID):$(GID) \
		-v $(PWD):/data \
		$(CONTAINER_NS)/$(CONTAINER_REPO) \
		$@

html:
	$(XSLT) -o $(HTML_OUTPUT) $(HTML_TRANSFORMER) $(XML_INPUT)


pdf: tex
	$(PDFLATEX) $(TEX_OUTPUT)

ps: dvi
	$(DVIPS) -o $(PS_OUTPUT) $(DVI_OUTPUT)

dvi: tex
	$(LATEX) $(TEX_OUTPUT)

tex:
	$(XSLT) -o $(TEX_OUTPUT) $(TEX_TRANSFORMER) $(XML_INPUT)

clean:
	rm -f *.aux *.log *.out

distclean: clean
	rm -f *.dvi *.tex *.ps *.pdf *.html *.rtf
