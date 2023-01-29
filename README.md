# PASTA Symmetric Cipher

This repository isolates the [PASTA](https://eprint.iacr.org/2021/731.pdf) symmetric cipher of the [hybrid-HE-framework](https://github.com/IAIK/hybrid-HE-framework) and bundles it as a static library.

## Compilation

Requirements:

- x86_64 architecture
- cmake
- autoconf
- autotool
- [ntl-11.4.3](https://www.shoup.net/ntl/ntl-11.4.3.tar.gz)
- [m4ri, release-20200125](https://github.com/malb/m4ri/releases/tag/release-20200125)

To compile the framework, execute the following commands from the root directory:

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
