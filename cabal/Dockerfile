FROM ubuntu:16.04

MAINTAINER John Ky <newhoggy@gmail.com>

ARG GHC_VERSION=8.0.2
ARG LTS_SLUG=lts-9.0
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
    apt-get -y install libsnappy1v5 libsnappy-dev                           && \
    rm -rf /var/lib/apt/lists/*

RUN stack install --install-ghc cabal-install                               && \
    rm -rf /root/.stack                                                     && \
    rm -rf /root/.stack-work
