FROM ubuntu:18.04

MAINTAINER Alexey Raga <alexey.raga@gmail.com>

ARG GHC_VERSION=8.4.3
ARG LTS_SLUG=lts-12.8
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
    rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -          && \
    apt-get install -y nodejs                                               && \
    rm -rf /var/lib/apt/lists/*

RUN stack install --install-ghc hpack                                       && \
    rm -rf /root/.stack                                                     && \
    rm -rf /root/.stack-work

# Buggy versions of ld.bfd fail to link some Haskell packages:
# https://sourceware.org/bugzilla/show_bug.cgi?id=17689. Gold is
# faster anyways and uses less RAM.
RUN update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.gold" 20
RUN update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.bfd" 10
