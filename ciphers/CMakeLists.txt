
# collect all sources for a plain_ciphers compilation unit

# plain
foreach(cipher IN ITEMS ${PLAIN_CIPHS})
    set(PLAIN_SRCS ${PLAIN_SRCS}
        ${cipher}/plain/${cipher}_plain.cpp
    )
endforeach()

add_library(plainciphers STATIC ${PLAIN_SRCS})
target_include_directories(plainciphers PRIVATE ${CMAKE_SOURCE_DIR}/.. ${M4RI_INCLUDE_DIR})
target_link_libraries(plainciphers ${M4RI_LIB} keccak aes perf)
