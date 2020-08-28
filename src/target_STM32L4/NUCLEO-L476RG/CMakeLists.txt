enable_language(ASM)

project(NUCLEO-L476RG)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/STM32L476RGTx_FLASH.ld)
include(stm32l4)


list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/BSP/STM32L4xx_Nucleo/stm32l4xx_nucleo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/CMSIS/Device/ST/STM32L4xx/Source/Templates/gcc/startup_stm32l476xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32l4xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32l4xx.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/STM32L4xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/CMSIS/Device/ST/STM32L4xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL4/Drivers/BSP/STM32L4xx_Nucleo
)

# for stm32l4xx.h
target_compile_definitions(${PROJECT_NAME} PUBLIC -DSTM32L476xx)

