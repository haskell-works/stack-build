FROM ubuntu:18.04

MAINTAINER John Ky <newhoggy@gmail.com>

ARG GHC_VERSION=8.6.5
ARG LTS_SLUG=lts-13.21
ARG PID1_VERSION=0.1.0.1
ARG DEBIAN_FRONTEND=noninteractive

# Set encoding to UTF-8 and PATH to find GHC and cabal/stack-installed binaries.
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/root/.cabal/bin:/root/.local/bin:/opt/ghc/$GHC_VERSION/bin:$PATH

RUN apt-get update                                                          && \
    apt-get -y install locales curl sudo                                    && \
    locale-gen en_US.UTF-8 && curl -sSL https://get.haskellstack.org/ | sh  && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install libsnappy1v5 libtinfo-dev libsnappy-dev jq           && \
    apt-get -y install liblzma5 liblzma-dev                                 && \
    apt-get -y install libz3-dev                                            && \
    apt-get -y install libpcre3 libpcre3-dev                                && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install python                                               && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install build-essential cmake libgmp3-dev gengetopt          && \
    apt-get -y install libpcap-dev flex byacc libjson-c-dev pkg-config      && \
    apt-get -y install libunistring-dev                                     && \
    rm -rf /var/lib/apt/lists/*

RUN stack install --install-ghc hpack                                       && \
    rm -rf /root/.stack                                                     && \
    rm -rf /root/.stack-work
