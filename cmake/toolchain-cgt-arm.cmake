# https://www.ti.com/tool/ARM-CGT

# Append current directory to CMAKE_MODULE_PATH for making device specific cmake modules visible
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Target definition
set(CMAKE_SYSTEM_NAME  Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

#---------------------------------------------------------------------------------------
# Set toolchain paths
#---------------------------------------------------------------------------------------

# Set system depended extensions
if(WIN32)
    set(TOOLCHAIN_EXT ".exe" )
else()
    set(TOOLCHAIN_EXT "" )
endif()

# Perform compiler test with static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(TOOLCHAIN_BIN_DIR ${CCS_ROOT}/${TOOLCHAIN_DIR}/bin)
list(APPEND TOOLCHAIN_INC_DIRS ${CCS_ROOT}/${TOOLCHAIN_DIR}/include ${CCS_ROOT}/ccs_base/arm/include/CMSIS)
set(TOOLCHAIN_LIB_DIR ${CCS_ROOT}/${TOOLCHAIN_DIR}/lib)

set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/armcl${TOOLCHAIN_EXT} CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/armcl${TOOLCHAIN_EXT} CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_DIR}/armcl${TOOLCHAIN_EXT} CACHE INTERNAL "ASM Compiler")


