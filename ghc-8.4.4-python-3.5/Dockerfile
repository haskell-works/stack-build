FROM ubuntu:16.04

MAINTAINER John Ky <newhoggy@gmail.com>

ARG GHC_VERSION=8.4.4
ARG PID1_VERSION=0.1.0.1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update                                                          && \
    apt-get -y install software-properties-common                           && \
    add-apt-repository ppa:hvr/ghc                                          && \
    apt-get -y remove --purge software-properties-common                    && \
    apt-get -y autoremove                                                   && \
    echo Done

RUN apt-get update                                                          && \
    apt-get -y install locales curl wget sudo git                           && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install g++ libstdc++6                                       && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install libsnappy1v5 libtinfo-dev libsnappy-dev jq           && \
    apt-get -y install zlib1g zlib1g-dev                                    && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install libz3-dev                                            && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install libpq5 libpq-dev                                     && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install alex-3.1.7 cabal-install-2.4 happy-1.19.5            && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install hspec-discover libyaml-0-2                           && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install ghc-8.4.4                                            && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get -y install zip                                                  && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update                                                          && \
    apt-get install -y pkg-config python3.5-dev realpath                    && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.5 /usr/bin/python

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/root/.cabal/bin:/root/.local/bin:/opt/ghc/bin:$PATH

RUN mkdir -p /root/.local/bin
