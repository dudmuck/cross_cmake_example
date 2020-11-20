This example project is not providing any abstraction layer between MCU vendors, but will use abstraction layer provided by vendor.

Purpose is for testing [cmake_ide_generator](https://github.com/dudmuck/cmake_ide_generator)

#  usage
If you dont have GCC for ARM installed, [download toolchain here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)

## installing vendor MCU drivers
In the case of STM32, go into target_* directory for the device you're building for:

```
$ git submodule update .
```
The dot represents current directory, which prevents all submodules for every target from being cloned.  When specifying directory of submodule, only the submodule of interest is cloned.  

to aid running cmake, shell script example ``cfg.sh`` is provided:

```
cmake -DTOOLCHAIN_PREFIX="~/gcc-arm-none-eabi-9-2020-q2-update" \
      -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-arm-none-eabi.cmake" \      
    ..
```

# using on windows
If you insist on using windows, read the following:

Since dos cmd doesnt have tab completion, using windows powershell [or windows terminal]([https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)) might be preferable.  However, default security prevents running batch file, even though cmd prompt runs them without complaining.

Since windows command prompt, doesnt have tab completion, try windows power shell ([read about allowing script execution policy](https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/)), or windows terminal if you want multiple terminals in tabs.  An example ``cfg.ps1`` is provided.
``Set-ExecutionPolicy Bypass -Scope CurrentUser
``
### windows anti-malware while compiling
If compiling takes too long, [add exclusion to windows security](https://support.microsoft.com/en-us/help/4028485/windows-10-add-an-exclusion-to-windows-security).
(your object files are such a potential threat to windows, shame on you)

