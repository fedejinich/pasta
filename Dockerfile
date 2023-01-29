FROM --platform=linux/amd64 ubuntu:22.04

# install build essentials
RUN apt-get -y update && apt-get -y install build-essential libssl-dev

# install wget
RUN apt-get -y install wget

# install cmake
RUN apt -y install cmake

# install git
RUN apt-get -y install git

RUN apt-get -y install libgmp3-dev

RUN apt-get -y install autoconf libtool

# copy content
COPY . /fhe
WORKDIR /fhe

ENTRYPOINT [ "/bin/bash" ]
