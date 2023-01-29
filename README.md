# PASTA Symmetric Cipher

This repository isolates the [PASTA](https://eprint.iacr.org/2021/731.pdf) symmetric cipher of the [hybrid-HE-framework.](https://github.com/IAIK/hybrid-HE-framework).

## Compilation

Requirements:
- x86_64 architecture
- cmake
- autoconf
- autotool

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
