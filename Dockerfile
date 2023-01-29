FROM --platform=linux/amd64 ubuntu:22.04

# set env variables
ENV NTL_VERSION="ntl-11.4.3"
ENV M4RI_VERSION="release-20200125"

# install base dependencies
RUN apt-get -y update && apt-get -y install build-essential libssl-dev autoconf libtool git libgmp3-dev cmake wget

# install ntl
RUN mkdir ntl_temp && \
  cd ntl_temp && \
  wget https://www.shoup.net/ntl/$NTL_VERSION.tar.gz  && \ 
  tar xf $NTL_VERSION.tar.gz && \
  rm $NTL_VERSION.tar.gz  && \
  cd $NTL_VERSION/src  && \
  ./configure SHARED=on NTL_GMP_LIP=on NTL_THREADS=on NTL_THREAD_BOOST=on NTL_EXCEPTIONS=on  && \
  make -j4 && \
  make install DESTDIR=$(pwd)/../../NTL && \
  cd ../../..

# install m4ri
RUN mkdir m4ri_temp && \
  cd m4ri_temp && \
  wget https://github.com/malb/m4ri/archive/refs/tags/M4RI_VERSION.tar.gz && \
  autoreconf --install && \
  rm -rf installed && \
  mkdir installed && \
  ./configure --prefix=`pwd`/installed && \
  make -j4 && \
  make install && \
  cd ../..

# copy content
COPY . /fhe
WORKDIR /fhe

# build pasta
RUN mkdir build && \
  cd build && \
  cmake .. && \
  make -j4

ENTRYPOINT [ "/bin/bash" ]
