FROM ubuntu
USER root
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl unzip ca-certificates sudo vim wget software-properties-common python-software-properties apt-transport-https \ 
	&& dpkg --add-architecture i386 \
	&& wget -nc https://dl.winehq.org/wine-builds/Release.key \
	&& apt-key add Release.key \
	&& apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ \
	&& apt-get update \
	&& apt-get install -y --install-recommends winehq-stable \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd -ms /bin/bash -u 1000 u

USER u
ENV HOME /home/u
ENV WINEPREFIX /home/u/.wine
ENV WINEARCH win32
WORKDIR /home/u
