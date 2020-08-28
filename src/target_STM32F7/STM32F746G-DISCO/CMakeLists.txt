enable_language(ASM)

project(STM32F746G-DISCO)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/STM32F746NGHx_FLASH.ld)
include(stm32f7)


list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/BSP/STM32746G-Discovery/stm32746g_discovery.c
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32f7xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32f7xx.c
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/STM32F7xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/CMSIS/Device/ST/STM32F7xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeF7/Drivers/BSP/STM32746G-Discovery
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -DSTM32F746xx)


