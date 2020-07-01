
FROM ubuntu:focal
MAINTAINER Ramiro Bou <bouramiro@gmail.com>
LABEL Description="Minimal KiCad image based on Ubuntu"

ADD kicad-ppa.pgp .
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
	apt-get -y update && \
	apt-get -y install gnupg2 software-properties-common git xvfb  && \
	add-apt-repository --yes ppa:inkscape.dev/stable && \
        add-apt-repository --yes ppa:js-reynaud/kicad-5.1 && \
	apt-get -y update && apt-get -y install --no-install-recommends kicad inkscape && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* && \
	rm kicad-ppa.pgp
