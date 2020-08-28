enable_language(ASM)

project(B-L072Z-LRWAN1)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/STM32L072xZTx_FLASH.ld)
include(stm32l0)


list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/BSP/STM32L0xx_Nucleo/stm32l0xx_nucleo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/CMSIS/Device/ST/STM32L0xx/Source/Templates/gcc/startup_stm32l072xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32l0xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32l0xx.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/STM32L0xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/CMSIS/Device/ST/STM32L0xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL0/Drivers/BSP/STM32L0xx_Nucleo
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -DSTM32L072xx)


