
# plain
foreach(cipher IN ITEMS ${PLAIN_CIPHS})
    configure_file(plain_test.cpp.in "${cipher}_test.cpp")
    add_executable(${cipher}_test "${cipher}_test.cpp")
    target_link_libraries(${cipher}_test ${M4RI_LIB} plainciphers)
    target_include_directories(${cipher}_test PRIVATE ${CMAKE_SOURCE_DIR}/.. ${M4RI_INCLUDE_DIR})
    add_test(NAME ${cipher}_plain COMMAND $<TARGET_FILE:${cipher}_test>)
endforeach()

# SEAL
foreach(cipher IN ITEMS ${SEAL_CIPHS})
    configure_file(seal_test.cpp.in "${cipher}_seal_test.cpp")
    add_executable(${cipher}_seal_test "${cipher}_seal_test.cpp")
    target_link_libraries(${cipher}_seal_test SEAL::seal ${M4RI_LIB} sealciphers)
    target_include_directories(${cipher}_seal_test PRIVATE ${CMAKE_SOURCE_DIR}/.. ${M4RI_INCLUDE_DIR})
    add_test(NAME ${cipher}_seal COMMAND $<TARGET_FILE:${cipher}_seal_test>)
    include_directories(../util/keccak)
endforeach()
