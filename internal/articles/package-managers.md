# Package Managers

A package manager is a programming language's tool to create project environments and import external dependencies.

- [1. Vcpkg](#1-vcpkg)
- [2. Conan](#2-conan)
- [3. build2](#3-build2)
- [4. Hunter](#4-hunter)
- [5. cget](#5-cget)

A reasonable set of features for selecting a package manager is build system support (e.g. CMake), IDE integration, command line interface and distributed repositories.

## 1. Vcpkg

[Vcpkg](https://github.com/microsoft/vcpkg) is a C/C++ dependency manager from Microsoft for all platforms, buildsystems, and workflows.

vcpkg is a free C/C++ package manager for acquiring and managing libraries. Choose from over 1500 open source libraries to download and build in a single step or add your own private libraries to simplify your build process. Maintained by the Microsoft C++ team and open source contributors.

## 2. Conan

[Conan](https://github.com/conan-io/conan)  is a C/C++ package manager written in Python.

Conan is a MIT-licensed, Open Source package manager for C and C++ development, allowing development teams to easily and efficiently manage their packages and dependencies across platforms and build systems.

## 3. build2

[build2](https://github.com/build2/build2) is a C/C++ cross-platform toolchain for building and packaging code.

build2 is a modern build system and dependency manager for the C++ language that provide a consistent, out of the box interface across multiple platforms and compilers

## 4. Hunter

[Hunter](https://github.com/cpp-pm/hunter)  is a C/C++, CMake driven cross-platform package manager for Linux, Windows, macOS, iOS, Android, Raspberry Pi, etc.

Hunter does not need any external configuration file or run any application before editing the project or running cmake from command line. All the libraries to be installed are set in the file CMakeFiles.txt. If they are not available in the system, they are automatically downloaded and installed.

## 5. cget

[cget](https://github.com/pfultz2/cget)  is a C/C++ package retrieval, not a package manager.

cget creates a cmake toolchain file with the settings necessary to build and find the libraries.
