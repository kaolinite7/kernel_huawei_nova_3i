# KernelSU for Huawei Nova 3i (INE-LX1)

This repository provides the non-GKI integration of KernelSU v0.9.2 for the Huawei Nova 3i, kernel version 4.9.148. It includes the device-specific kernel source with KernelSU integrated within, and a Linux build script to compile the kernel image suitable for flashing on the target device.

#### *Tested on latest EMUI 9.1.0.333*

## Installation
 Download `KernelSU_11682_INE_LX1.img` from the releases page. Alternatively build it yourself by procedure given below. Afterwards, flash it in fastboot mode using the following command:

```bash
fastboot flash kernel ./KernelSU_11682_INE_LX1.img
fastboot reboot
```
After reboot install the corresponding [KernelSU Manager](https://github.com/tiann/KernelSU/releases/download/v0.9.2/KernelSU_v0.9.2_11682-release.apk).

## Building ( x86_64 POSIX systems only )

### Requirements
- `gcc-9`
- `python2.7`
- `bc`
- `inetutils`
- `make`, `git`, and standard distribution build tools

### Getting the source

```bash
git clone --recursive https://github.com/kaolinite7/kernel_huawei_nova_3i
cd kernel_huawei_nova_3i
```

### Run the build script

```bash
./build.sh
```
Once Built, the `kernel.img` will be in kernel source root.
