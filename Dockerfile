
FROM ubuntu:artful
MAINTAINER Seppe Stas <seppe@productize.be>
LABEL Description="Minimal KiCad image based on Ubuntu"

ADD kicad-ppa.pgp .
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
	echo 'deb http://ppa.launchpad.net/js-reynaud/kicad-4/ubuntu artful main' >> /etc/apt/sources.list && \
	apt-key add kicad-ppa.pgp && \
	apt-get -y update && apt-get -y install --no-install-recommends kicad=4.0.7+e2-6376~60~ubuntu17.10.1 && \
	rm -rf /var/lib/apt/lists/* && \
	rm kicad-ppa.pgp
