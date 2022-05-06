FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get -y update \
    && apt-get -y install \
        ca-certificates \
        gnupg

RUN echo "deb https://ppa.launchpadcontent.net/mozillacorp/mozillavpn/ubuntu focal main" \
        > /etc/apt/sources.list.d/mozillavpn.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1E51560313C444E0

RUN apt-get -y update

RUN apt-get -y install \
        mozillavpn \
        resolvconf

ENTRYPOINT bash
