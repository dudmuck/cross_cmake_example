
project(MSP-EXP432P401R)

# CACHE INTERNAL makes C_FLAGS show up in application
set(CMAKE_C_FLAGS "-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -g --display_error_number --abi=eabi --display_error_number " CACHE INTERNAL "C compiler flags")

set(CMAKE_EXE_LINKER_FLAGS "-z --stack_size=512 --search_path=${TOOLCHAIN_LIB_DIR} --rom_model --reread_libs ${CMAKE_CURRENT_SOURCE_DIR}/msp432p401r.cmd --warn_sections --display_error_number --xml_link_info=${PROJECT_NAME}_linkInfo.xml" CACHE INTERNAL "linker options")
    
list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/startup_msp432p401r_ccs.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_msp432p401r.c
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx/wdt_a.c
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx/gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx/interrupt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx/cpu.c
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx/sysctl.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})

set(TOOLCHAIN_INC_DIR ${CCS_ROOT}/${TOOLCHAIN_DIR}/include)
target_include_directories(${PROJECT_NAME} PUBLIC
    ${TOOLCHAIN_INC_DIR}
    ${CCS_ROOT}/ccs_base/arm/include
    ${CCS_ROOT}/ccs_base/arm/include/CMSIS
    ${CMAKE_CURRENT_SOURCE_DIR}/driverlib/MSP432P4xx
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -D__MSP432P401R__ -Dccs)

