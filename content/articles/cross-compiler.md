# Cross Compiler

A cross compiler is a compiler toolchain that runs on one platform (host) and produces binaries for another platform (target). It is a core building block for embedded systems, mobile platforms, and any workflow where the runtime environment differs from the build environment.

- [1. Overview](#1-overview)
- [2. Naming Convention](#2-naming-convention)
  - [2.1. Target Tuple Components](#21-target-tuple-components)
  - [2.2. Common Target Names](#22-common-target-names)
  - [2.3. Compiler Binary Suffixes](#23-compiler-binary-suffixes)
- [3. ARM Floating-Point ABI Variants](#3-arm-floating-point-abi-variants)
  - [3.1. ABI Modes](#31-abi-modes)
  - [3.2. Toolchain Defaults](#32-toolchain-defaults)
- [4. Glossary](#4-glossary)
- [5. References](#5-references)

## 1. Overview

Cross-compilation separates the machine that performs compilation from the machine that executes the output binary.

- Build Platform
  > The machine where source code is configured and compiled.

- Host Platform
  > The machine where the compiler toolchain itself runs.

- Target Platform
  > The machine or CPU/OS environment for which the output binary is generated.

## 2. Naming Convention

Most GNU-style cross toolchains use a canonical target naming format:

`[arch]-[vendor]-[os]-[abi]`

### 2.1. Target Tuple Components

- `arch`
  > Target CPU architecture, such as `arm`, `aarch64`, `mips`, `x86_64`, or `i686`.

- `vendor`
  > Toolchain or platform vendor identifier, such as `apple`, `pc`, or `none`.

- `os`
  > Target operating system, such as `linux`, `darwin`, or `none` for bare-metal systems.

- `abi`
  > Application Binary Interface, such as `eabi`, `gnueabi`, or `gnueabihf`.

### 2.2. Common Target Names

- `arm-none-eabi`
  > Bare-metal ARM target using the Embedded ABI; typically used for microcontrollers (for example Cortex-M and Cortex-R).

- `arm-none-linux-gnueabi` / `arm-linux-gnueabi`
  > ARM Linux target using GNU EABI; commonly used for user space, bootloader, and kernel-related builds on ARM Linux systems.

- `aarch64-linux-gnu`
  > 64-bit ARM Linux target for ARMv8-A and newer platforms.

- `i686-apple-darwin10`
  > 32-bit Intel target for macOS/Darwin toolchains.

- `arm-ostl-linux-gnueabi`
  > ARM Linux target tuple used in some OpenSTLinux/STMicroelectronics toolchain distributions.

- `arm-eabi`
  > Compact target name commonly seen in Android and embedded toolchain contexts.

### 2.3. Compiler Binary Suffixes

The toolchain tuple is often followed by a compiler frontend executable name.

- `arm-linux-gnueabi-gcc`
  > GCC frontend for the `arm-linux-gnueabi` target.

- `arm-linux-gnueabihf-gcc`
  > GCC frontend for the `arm-linux-gnueabihf` target.

## 3. ARM Floating-Point ABI Variants

For ARM toolchains, `gnueabi` and `gnueabihf` typically differ by default floating-point ABI behavior.

### 3.1. ABI Modes

`-mfloat-abi` controls how floating-point operations and parameter passing are handled.

- `soft`
  > Uses software emulation for floating-point computation and passes parameters in core integer registers. This mode offers broad compatibility but lower floating-point performance.

- `softfp`
  > Uses hardware FPU instructions when available but still passes parameters in core integer registers. This mode is commonly interoperable with `soft` in many ABI contexts.

- `hard`
  > Uses hardware FPU for computation and passes parameters in FPU registers. This provides better floating-point performance but is not binary-compatible with `softfp` objects.

### 3.2. Toolchain Defaults

- `arm-linux-gnueabi-gcc`
  > Commonly associated with `softfp`-oriented ARM EABI distributions.

- `arm-linux-gnueabihf-gcc`
  > Uses hard-float ABI conventions (`hard`) and generally provides better floating-point performance where hardware support exists.

## 4. Glossary

- ABI
  > Application Binary Interface: a low-level contract defining calling conventions, binary formats, and interoperability rules between compiled components.

- EABI
  > Embedded Application Binary Interface: ABI conventions tailored for embedded targets such as ARM and MIPS.

- amd64
  > AMD's 64-bit extension of x86; commonly referred to as `x86_64`.

- arm64
  > 64-bit ARM architecture, also known as AArch64.

- x86_64
  > 64-bit x86 instruction set architecture implemented by both AMD and Intel.

## 5. References

- GNU [Configure terms](https://www.gnu.org/software/autoconf/manual/autoconf-2.70/html_node/Specifying-Target-Triplets.html) page.
- ARM [Procedure call standard for the Arm architecture (AAPCS)](https://github.com/ARM-software/abi-aa/releases) page.
- GCC [ARM options](https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html) page.
- Actorsfit [arm cross compiler](https://blog.actorsfit.com/a?ID=01700-1ce8edc2-d16c-4135-9abc-fd37ff641c25) article.
