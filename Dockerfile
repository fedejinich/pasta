FROM --platform=linux/amd64 ubuntu:22.04

# install base dependencies
RUN apt-get -y update && apt-get -y install build-essential libssl-dev autoconf libtool git libgmp3-dev cmake wget

# copy content
COPY . /pasta
WORKDIR /pasta

# build pasta
RUN mkdir build && \
  cd build && \
  cmake .. && \
  make -j4 && \
  ctest --verbose

ENTRYPOINT [ "/bin/bash" ]
