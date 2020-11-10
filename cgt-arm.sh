
cmake -DCCS_ROOT=$HOME/ti/ccs1010/ccs \
      -DTOOLCHAIN_DIR="tools/compiler/ti-cgt-arm_20.2.2.LTS" \
      -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-cgt-arm.cmake" \
      -DBOARD=MSP-EXP432P401R \
    ..

#      -DBOARD=NUCLEO-L476RG \
#      -DBOARD=NUCLEO-G071RB \
#      -DBOARD=NUCLEO-L152RE \
#      -DBOARD=B-L072Z-LRWAN1 \
