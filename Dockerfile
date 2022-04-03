FROM ubuntu:latest

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends \
        software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:mozillacorp/mozillavpn
RUN apt-get -y update \
    && apt-get -y install \
        mozillavpn \
        resolvconf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y purge \
        software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean

