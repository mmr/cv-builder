NS = mribeiro
REPO = cv-builder
NAME = cv-builder
UID = $(id -u)
GID = $(id -g)

build:
	docker build -t $(NS)/$(REPO) .

run:
	docker run \
		--rm -i --user=$(UID):$(GID) \
		-v $(PWD):/data \
		$(NS)/$(REPO) \
		make -f Makefile

default: build
