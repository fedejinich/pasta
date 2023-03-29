# PASTA
add_executable(pasta_test "pasta_test.cpp")
target_link_libraries(pasta_test pastacipher)
target_include_directories(pasta_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME pasta COMMAND $<TARGET_FILE:pasta_test>)

## BFV
add_executable(bfv_test "bfv_test.cpp")
target_link_libraries(bfv_test SEAL::seal bfvcipher)
target_include_directories(bfv_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME bfv COMMAND $<TARGET_FILE:bfv_test>)
include_directories(../util/keccak)