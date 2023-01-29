FROM --platform=linux/amd64 ubuntu:22.04

# install base dependencies
RUN apt-get -y update && apt-get -y install build-essential libssl-dev autoconf libtool git libgmp3-dev cmake wget

# set env variables
ENV M4RI_VERSION="release-20200125"
ENV M4RI_PREFIX="/m4ri_temp/m4ri-${M4RI_VERSION}/installed"
ENV M4RI_INCLUDE_DIR="${M4RI_PREFIX}/include"
ENV M4RI_LIB="${M4RI_PREFIX}/lib/libm4ri.so"

# install m4ri
RUN mkdir m4ri_temp && \
  cd m4ri_temp && \
  wget https://github.com/malb/m4ri/archive/refs/tags/$M4RI_VERSION.tar.gz && \
  tar xf $M4RI_VERSION.tar.gz && \
  cd m4ri-${M4RI_VERSION} && \
  autoreconf --install && \
  rm -rf installed && \
  mkdir installed && \
  ./configure --prefix=`pwd`/installed && \
  make -j4 && \
  make install && \
  cd ../../..

# copy content
COPY . /pasta
WORKDIR /pasta

# build pasta
RUN mkdir build && \
  cd build && \
  cmake .. && \
  make -j4

ENTRYPOINT [ "/bin/bash" ]
