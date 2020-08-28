
project(mcu-proj)
cmake_minimum_required(VERSION 3.6)

set(BOARD_LIST NUCLEO-L476RG NUCLEO-L073RZ NUCLEO-L152RE B-L072Z-LRWAN1)
set(BOARD NUCLEO-L073RZ CACHE STRING "Default target platform is NUCLEO-L073RZ")
set_property(CACHE BOARD PROPERTY STRINGS ${BOARD_LIST})

# list of of software applications
set(APPLICATION_LIST ledBlink)
set(APPLICATION ledBlink CACHE STRING "Default Application is ledBlink")
set_property(CACHE APPLICATION PROPERTY STRINGS ${APPLICATION_LIST})

# Switch for debugger support.
option(USE_DEBUGGER "Use Debugger" ON)

#---------------------------------------------------------------------------------------
# Target Boards
#---------------------------------------------------------------------------------------

if(BOARD STREQUAL NUCLEO-L073RZ)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32L0/NUCLEO-L073RZ)
    set(STM32 1)
elseif(BOARD STREQUAL B-L072Z-LRWAN1)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32L0/B-L072Z-LRWAN1)
    set(STM32 1)
elseif(BOARD STREQUAL NUCLEO-L152RE)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32L1/NUCLEO-L152RE)
    set(STM32 1)
elseif(BOARD STREQUAL NUCLEO-L476RG)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32L4/NUCLEO-L476RG)
    set(STM32 1)
elseif(BOARD STREQUAL NUCLEO-G071RB)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32G0/NUCLEO-G071RB)
    set(STM32 1)
elseif(BOARD STREQUAL STM32F746G-DISCO)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/target_STM32F7/STM32F746G-DISCO)
    set(STM32 1)
endif()


if(APPLICATION STREQUAL ledBlink)

    if (STM32)
        add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/apps/stm32/led-blink)
    endif()

elseif(APPLICATION STREQUAL someOtherApp)

    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/apps/someOtherApp)

endif()

