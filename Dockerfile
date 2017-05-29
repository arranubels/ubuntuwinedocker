FROM ubuntu:16.10
USER root
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl unzip ca-certificates sudo vim wget software-properties-common python-software-properties apt-transport-https bzip2 git bsdmainutils isomd5sum mc \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y --install-recommends wine32 wine-stable \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd -ms /bin/bash -u 1000 u

USER u
ENV HOME /home/u
ENV WINEPREFIX /home/u/.wine
ENV WINEARCH win32
WORKDIR /home/u
