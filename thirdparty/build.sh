#!/usr/bin/env bash

git submodule update --init --recursive

NTL_VERSION="ntl-11.4.3"

wget https://www.shoup.net/ntl/$NTL_VERSION.tar.gz  \
 && tar xf $NTL_VERSION.tar.gz  \
 && rm $NTL_VERSION.tar.gz  \
 && cd $NTL_VERSION/src  \
 && ./configure SHARED=on NTL_GMP_LIP=on NTL_THREADS=on NTL_THREAD_BOOST=on NTL_EXCEPTIONS=on  \
 && make -j4 \
 && make install DESTDIR=$(pwd)/../../NTL \
 && cd ../.. \
 && rm -r $NTL_VERSION

cd m4ri \
  && autoreconf --install \
  && rm -rf installed \
  && mkdir installed \
  && ./configure --prefix=`pwd`/installed \
  && make -j4 \
  && make install \
  && cd ..
