
project(led-blink-${BOARD})

add_executable(${PROJECT_NAME}
    main.c
    $<TARGET_OBJECTS:${BOARD}>
)

target_include_directories(${PROJECT_NAME} PUBLIC
    $<TARGET_PROPERTY:${BOARD},INTERFACE_INCLUDE_DIRECTORIES>
)

target_compile_definitions(${PROJECT_NAME} PUBLIC
    $<TARGET_PROPERTY:${BOARD},INTERFACE_COMPILE_DEFINITIONS>
)

#include(binutils-arm-none-eabi)
#create_bin_output(${PROJECT_NAME})


