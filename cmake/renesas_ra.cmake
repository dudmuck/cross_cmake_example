# Object build options
set(OBJECT_GEN_FLAGS "-mcpu=cortex-m23 -mthumb -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g")

include(mcu)

# Linker flags

set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m23 -mthumb -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -L${CMAKE_CURRENT_SOURCE_DIR} -T${LINKER_SCRIPT} -Xlinker --gc-sections -Wl,-Map=${CMAKE_PROJECT_NAME}.map --specs=nano.specs --specs=rdimon.specs" CACHE INTERNAL "Linker options")

