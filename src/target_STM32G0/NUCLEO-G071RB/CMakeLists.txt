enable_language(ASM)

project(NUCLEO-G071RB)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/STM32G071RBTx_FLASH.ld)
include(stm32g0)


list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/BSP/STM32G0xx_Nucleo/stm32g0xx_nucleo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/CMSIS/Device/ST/STM32G0xx/Source/Templates/gcc/startup_stm32g071xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32g0xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32g0xx.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/STM32G0xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/CMSIS/Device/ST/STM32G0xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeG0/Drivers/BSP/STM32G0xx_Nucleo
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -DSTM32G071xx)


