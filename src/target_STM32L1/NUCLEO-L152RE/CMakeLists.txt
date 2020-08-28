enable_language(ASM)

project(NUCLEO-L152RE)

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/STM32L152RETx_FLASH.ld)
include(stm32l1)


list(APPEND ${PROJECT_NAME}_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/BSP/STM32L1xx_Nucleo/stm32l1xx_nucleo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32l1xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/system_stm32l1xx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.s
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/STM32L1xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/CMSIS/Device/ST/STM32L1xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/../STM32CubeL1/Drivers/BSP/STM32L1xx_Nucleo
)

target_compile_definitions(${PROJECT_NAME} PUBLIC -DSTM32L152xE)

