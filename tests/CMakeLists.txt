
# plain
foreach(cipher IN ITEMS ${PLAIN_CIPHS})
    configure_file(plain_test.cpp.in "${cipher}_test.cpp")
    add_executable(${cipher}_test "${cipher}_test.cpp")
    target_link_libraries(${cipher}_test ${M4RI_LIB} plainciphers)
    target_include_directories(${cipher}_test PRIVATE ${CMAKE_SOURCE_DIR}/.. ${M4RI_INCLUDE_DIR})
    add_test(NAME ${cipher}_plain COMMAND $<TARGET_FILE:${cipher}_test>)
endforeach()
