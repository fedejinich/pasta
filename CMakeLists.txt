cmake_minimum_required(VERSION 3.10)
project(symhe)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)

option(BUILD_TESTS "Build tests for HHE" ON)

set(PLAIN_CIPHS pasta_3)
set(SEAL_CIPHS pasta_3)

add_subdirectory(util)
add_subdirectory(thirdparty)

# Import Microsoft SEAL
find_package(SEAL 3.6.2 REQUIRED
        # Optionaly providing a path so this can be built without installing SEAL
        PATHS ${symhe_SOURCE_DIR}/thirdparty/SEAL/build/cmake
        )

# collect all cipher implementations
add_subdirectory(src)

# add tests
enable_testing()
add_subdirectory(tests)
