FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y \
	 wget \
    && wget https://github.com/jamulussoftware/jamulus/releases/download/r3_9_1/jamulus-headless_3.9.1_ubuntu_amd64.deb -O /tmp/jamulus.deb \
    && apt --no-install-recommends --fix-broken install -y /tmp/jamulus.deb \
    && apt purge wget -y \
    && apt autoremove -y \
    && rm -rf /tmp/jamulus.deb /var/lib/apt/lists/*

EXPOSE 22124/udp

ENTRYPOINT ["Jamulus"]
