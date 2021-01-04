
cmake -DTOOLCHAIN_PREFIX=$HOME/gcc-arm-none-eabi-9-2020-q2-update \
      -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-arm-none-eabi.cmake" \
      -DBOARD=NUCLEO-L476RG \
    ..

#      -DAPPLICATION=ledBlink-cpp \
#      -DBOARD=NUCLEO-L152RE \
#      -DBOARD=NUCLEO-G071RB \
#      -DBOARD=NUCLEO-L152RE \
#      -DBOARD=B-L072Z-LRWAN1 \
