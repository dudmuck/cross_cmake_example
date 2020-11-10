
<#
Windows powershell by default doesnt allow running scripts, enable with:
Set-ExecutionPolicy Bypass -Scope CurrentUser
#>

cmake -G "MinGW Makefiles" `
    -DTOOLCHAIN_PREFIX="C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update" `
    -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-arm-none-eabi.cmake" `
    -DBOARD=EK-RA2A1 `
    ..

<#
R7FA2A1AB3CFM
    -DBOARD=STM32F746G-DISCO `
    -DBOARD=NUCLEO-L152RE `
    -DBOARD=B-L072Z-LRWAN1 `
    -DBOARD=NUCLEO-G071RB `
    -DBOARD=NUCLEO-L476RG `
    -DBOARD=NUCLEO-L073RZ `
#>
