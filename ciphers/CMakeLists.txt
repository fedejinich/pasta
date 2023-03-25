
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


# SEAL
foreach(cipher IN ITEMS ${SEAL_CIPHS})
    set(SEAL_SRCS ${SEAL_SRCS}
            ${cipher}/seal/${cipher}_seal.cpp
            ${cipher}/plain/${cipher}_plain.cpp # some functions from plain impl are required
            )
endforeach()
set(SEAL_SRCS ${SEAL_SRCS} common/SEAL_Cipher.cpp common_Zp/SEAL_Cipher.cpp)
add_library(sealciphers STATIC ${SEAL_SRCS})
target_include_directories(sealciphers PRIVATE ${CMAKE_SOURCE_DIR}/.. ${M4RI_INCLUDE_DIR})
target_link_libraries(sealciphers SEAL::seal ${M4RI_LIB} keccak aes)