Curriculum Vitae builder
=====

**cv-builder** is a tool to help you create a beautiful _curriculum vitae_ in several different formats.

Setup
-----
It uses docker to make the setup simpler, so you will not have to install all the dependencies manually.

All you have to do is:

1. [Install docker](https://docs.docker.com/installation/)
1. Add your local user to docker group:
```bash
sudo usermod -aG docker <your_user>
```
1. Pull image ([from Hub](https://registry.hub.docker.com/u/mribeiro/cv-builder)):
```bash
docker pull mribeiro/cv-builder
```
or build locally using this repo (which is way much cooler):
```bash
make build-image
```

Usage:
-----
```bash
make
```
