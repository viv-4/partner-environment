FROM alpine:edge

ARG SHARDS_VERSION="0.8.1"
ARG CRYSTAL_RC="0.31.1-r1"

RUN apk add --no-cache \
    curl \
    git \
    build-base \
    libressl-dev \
    libxml2-dev \
    pcre-dev \
    yaml-dev \
    zlib-dev

# Add crystal from edge
RUN apk add crystal --no-cache

# Compile shards
RUN curl -L https://github.com/crystal-lang/shards/archive/v${SHARDS_VERSION}.tar.gz | tar -xz
RUN CRFLAGS=--release make -C ./shards-${SHARDS_VERSION}

# Add shards binary to path
RUN mv /shards-${SHARDS_VERSION}/bin/shards /usr/bin

# Remove build artefacts
RUN rm -r /shards-${SHARDS_VERSION}
RUN apk del build-base

RUN du -h /
