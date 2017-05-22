FROM ubuntu

# Inspired by monokrome/wine
USER root

# Install some tools required for creating the image
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		ca-certificates \ 
		wine \
		wine32 \
		&& rm -rf /var/lib/apt/lists/*

USER u 
ENV HOME /home/u
ENV WINEPREFIX /home/u/.wine
ENV WINEARCH win32

WORKDIR /home/u

