cmake_minimum_required(VERSION 3.10)
project(symhe)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)

option(BUILD_TESTS "Build tests for HHE" ON)

# Select ciphers to benchmark
set(PLAIN_CIPHS
  pasta_3
  pasta_4
)

include(CheckCCompilerFlag)
function(check_c_compiler_flag_and_add flag result)
  check_c_compiler_flag("${flag}" ${result})
  if(${result})
    add_compile_options("${flag}")
  endif()
endfunction()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build." FORCE)
endif()

# for AES code
if(MSVC)
  add_definitions("-DOC_ENABLE_SSE2")
  message("-- Enabling SSE2 for AES")
  add_definitions("-DOC_ENABLE_AESNI")
  message("-- Enabling AES_NI")
else()
  check_c_compiler_flag_and_add(-msse2 CC_SUPPORTS_SSE2)
  if(CC_SUPPORTS_SSE2)
    add_definitions("-DOC_ENABLE_SSE2")
    message("-- Enabling SSE2 for AES")
  endif()

  check_c_compiler_flag_and_add(-maes CC_SUPPORTS_AES)
  if(CC_SUPPORTS_AES)
    add_definitions("-DOC_ENABLE_AESNI")
    message("-- Enabling AES_NI")
  else()
    add_definitions("-DOC_ENABLE_PORTABLE_AES")
  endif()
endif()

add_subdirectory(util)
#add_subdirectory(thirdparty)

# set(M4RI_PREFIX "${CMAKE_SOURCE_DIR}/thirdparty/m4ri/installed")
# set(M4RI_INCLUDE_DIR "${M4RI_PREFIX}/include")
# set(M4RI_LIB "${M4RI_PREFIX}/lib/libm4ri.so")

# collect all cipher implementations
add_subdirectory(ciphers)

# add tests
if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
