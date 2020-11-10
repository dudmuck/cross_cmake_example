
if(NOT DEFINED LINKER_SCRIPT)
    message(FATAL_ERROR "No linker script defined")
endif(NOT DEFINED LINKER_SCRIPT)
    message("Linker script: ${LINKER_SCRIPT}")

if (${CMAKE_C_COMPILER} MATCHES "gcc")
    set(CMAKE_C_FLAGS "${OBJECT_GEN_FLAGS} -std=gnu99 " CACHE INTERNAL "C Compiler options")
    set(CMAKE_CXX_FLAGS "${OBJECT_GEN_FLAGS} -std=c++11 " CACHE INTERNAL "C++ Compiler options")
    set(CMAKE_ASM_FLAGS "${OBJECT_GEN_FLAGS} -x assembler-with-cpp " CACHE INTERNAL "ASM Compiler options")
elseif (${CMAKE_C_COMPILER} MATCHES "armcl")
    message("mcu-armcl TOOLCHAIN_PREFIX: ${TOOLCHAIN_PREFIX}")
    include_directories(
        ${TOOLCHAIN_INC_DIR}
        ${TOOLCHAIN_PREFIX}/../../../ccs_base/arm/include/CMSIS
    )
    add_definitions(
        -D__RAM_FUNC=__attribute__\(\(ramfunc\)\)
        -D__weak=__attribute__\(\(weak\)\)
    )

    set(CMAKE_C_FLAGS "-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -g --display_error_number --abi=eabi --display_error_number " CACHE INTERNAL "C compiler flags")
else()
    message("mcu-NOT-gcc ${CMAKE_C_COMPILER}")
endif()

