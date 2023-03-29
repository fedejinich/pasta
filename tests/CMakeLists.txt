
# plain
configure_file(pasta_test.cpp.in "pasta_plain_test.cpp")
add_executable(pasta_plain_test "pasta_plain_test.cpp")
target_link_libraries(pasta_plain_test pastacipher)
target_include_directories(pasta_plain_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME pasta COMMAND $<TARGET_FILE:pasta_plain_test>)

## BFV
add_executable(bfv_test "bfv_test.cpp")
target_link_libraries(bfv_test SEAL::seal bfvcipher)
target_include_directories(bfv_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME bfv COMMAND $<TARGET_FILE:bfv_test>)
include_directories(../util/keccak)