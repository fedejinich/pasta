#!/usr/bin/env bash

git submodule update --init --recursive

cd SEAL \
  && rm -rf build \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make -j4 \
  && cd ../..