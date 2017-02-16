FROM node:7

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            git-core \
            jq \
            calibre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g gitbook-cli phantomjs

USER node

ENV GITBOOK_VERSION 3.2.2

RUN gitbook fetch ${GITBOOK_VERSION}

ONBUILD COPY scripts /scripts

WORKDIR /gitbook

VOLUME /gitbook
