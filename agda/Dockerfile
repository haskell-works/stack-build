FROM quay.io/haskell_works/stack-build-minimal

RUN apt-get update                                                          && \
    apt-get -y install agda ruby bundler libicu-dev                         && \
    locale-gen en_US.UTF-8 && curl -sSL https://get.haskellstack.org/ | sh  && \
    rm -rf /var/lib/apt/lists/*

RUN cd /root                                            && \
    git clone https://github.com/wenkokke/agda2html.git && \
    cd agda2html                                        && \
    stack install                                       && \
    mv .local/bin/agda2html /usr/local/bin/             && \
    rm -rf .stack
