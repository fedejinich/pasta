cmake_minimum_required(VERSION 3.10)
project(symhe)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)

option(BUILD_TESTS "Build tests for HHE" ON)

set(PLAIN_CIPHS pasta_3)
set(SEAL_CIPHS pasta_3)

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

add_subdirectory(util)

#find_package(SEAL 3.6.2 QUIET)

#if (NOT SEAL_FOUND)
  #     prep external libraries
  add_subdirectory(thirdparty)
#endif()

# Import Microsoft SEAL
find_package(SEAL 3.6.2 REQUIRED
        # Optionaly providing a path so this can be built without installing SEAL
        PATHS ${symhe_SOURCE_DIR}/thirdparty/SEAL/build/cmake
        )

# set(M4RI_PREFIX "${CMAKE_SOURCE_DIR}/thirdparty/m4ri/installed")
# set(M4RI_INCLUDE_DIR "${M4RI_PREFIX}/include")
# set(M4RI_LIB "${M4RI_PREFIX}/lib/libm4ri.so")

# collect all cipher implementations
add_subdirectory(src)

# add tests
enable_testing()
add_subdirectory(tests)
