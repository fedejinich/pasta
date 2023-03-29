# PASTA Symmetric Cipher

This repository contains a C++ library to build hybrid homomorphic schemes, using [PASTA](https://eprint.iacr.org/2021/731.pdf) as symmetric cipher and [BFV](https://eprint.iacr.org/2012/144.pdf) as homomorphic cipher.

## Build

Requirements:
- cmake

```bash
mkdir build
cd build
cmake ..
make -j4
```

### Dockerfile

To build the Dockerfile

```bash
> docker buildx build --platform linux/amd64 -t pasta .
> docker run --rm -it pasta
```