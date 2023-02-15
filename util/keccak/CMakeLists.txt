cmake_minimum_required(VERSION 3.4.1)
project(Keccak C)

set(KECCAK_SRCS
  KeccakSpongeWidth1600.c
  KeccakHash.c
  )

set(KECCAK_SRCS ${KECCAK_SRCS}
  opt64/KeccakP-1600-opt64.c
  )

add_library(keccak STATIC ${KECCAK_SRCS})
target_include_directories(keccak PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(keccak PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/opt64/")
