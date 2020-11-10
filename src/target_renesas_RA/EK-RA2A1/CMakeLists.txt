
project(EK-RA2A1)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/fsp.ld)
include(renesas_ra)

list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/configuration.xml
    ${CMAKE_CURRENT_SOURCE_DIR}/RA2A1-EK.pincfg
    ${CMAKE_CURRENT_SOURCE_DIR}/R7FA2A1AB3CFM.pincfg
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_gen/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_gen/hal_data.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_gen/common_data.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_gen/pin_data.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ra/board/ra2a1_ek/board_init.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ra/board/ra2a1_ek/board_leds.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_delay.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_irq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_group_irq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_register_protection.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_clocks.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/all/bsp_io.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/r_ioport/r_ioport.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/startup.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/system.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_gen
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/inc/api
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/inc/instances
    ${CMAKE_CURRENT_SOURCE_DIR}/../fsp/ra/fsp/src/bsp/mcu/ra2a1
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_cfg/fsp_cfg/bsp
    ${CMAKE_CURRENT_SOURCE_DIR}/ra_cfg/fsp_cfg
    ${CMAKE_CURRENT_SOURCE_DIR}/ra/arm/CMSIS_5/CMSIS/Core/Include
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -D_RENESAS_RA_)
