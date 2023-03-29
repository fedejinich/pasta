add_subdirectory(keccak)

cmake_minimum_required(VERSION 3.10)
project(Perf C)

set(PERF_SRCS
  perf.c
  )

add_library(perf STATIC ${PERF_SRCS})

target_include_directories(perf PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
