# PASTA
set(PLAIN_SRCS ${PLAIN_SRCS} ciphers/pasta/pasta.cpp)
add_library(pastacipher STATIC ${PLAIN_SRCS})
target_include_directories(pastacipher PRIVATE ${CMAKE_SOURCE_DIR}/..)
target_link_libraries(pastacipher ${M4RI_LIB} keccak aes perf)

# BFV
set(SEAL_SRCS ${SEAL_SRCS} ciphers/bfv/bfv_seal.cpp ciphers/pasta/pasta.cpp) # some functions from plain impl are required
set(SEAL_SRCS ${SEAL_SRCS} common/seal_cipher.cpp)
add_library(bfvcipher STATIC ${SEAL_SRCS})
target_include_directories(bfvcipher PRIVATE ${CMAKE_SOURCE_DIR}/..)
target_link_libraries(bfvcipher SEAL::seal keccak aes)