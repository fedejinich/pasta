
# plain
configure_file(pasta_test.cpp.in "pasta_plain_test.cpp")
add_executable(pasta_plain_test "pasta_plain_test.cpp")
target_link_libraries(pasta_plain_test pastacipher)
target_include_directories(pasta_plain_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME pasta_test COMMAND $<TARGET_FILE:pasta_plain_test>)

# SEAL
configure_file(bfv_test.cpp.in "bfv_seal_test.cpp")
add_executable(bfv_seal_test "bfv_seal_test.cpp")
target_link_libraries(bfv_seal_test SEAL::seal bfvcipher)
target_include_directories(bfv_seal_test PRIVATE ${CMAKE_SOURCE_DIR}/..)
add_test(NAME bfv_seal COMMAND $<TARGET_FILE:bfv_seal_test>)
include_directories(../util/keccak)
