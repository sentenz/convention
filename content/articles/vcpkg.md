# Vcpkg

[Vcpkg](https://vcpkg.io/en/) is a dependency manager for C/C++ libraries designed for C and C++ projects on Windows, Linux, and macOS. It can be used to install packages from a variety of sources, including the official C++ package repositories and custom registry repositories.

- [1. Category](#1-category)
  - [1.1. Vcpkg Mode](#11-vcpkg-mode)
    - [1.1.1. Classic Mode](#111-classic-mode)
    - [1.1.2. Manifest Mode](#112-manifest-mode)
      - [1.1.2.1. Versioning](#1121-versioning)
      - [1.1.2.2. Triplets](#1122-triplets)
      - [1.1.2.3. Binary Cache](#1123-binary-cache)
      - [1.1.2.4. Software Bill of Materials (SBOM)](#1124-software-bill-of-materials-sbom)
  - [1.2. Vcpkg Registry](#12-vcpkg-registry)
    - [1.2.1. Registry](#121-registry)
      - [1.2.1.1. Ports](#1211-ports)
      - [1.2.1.2. Patches](#1212-patches)
    - [1.2.2. Templates](#122-templates)
      - [1.2.2.1. Library](#1221-library)
      - [1.2.2.2. Application](#1222-application)
- [2. References](#2-references)

## 1. Category

### 1.1. Vcpkg Mode

#### 1.1.1. Classic Mode

1. Commands and Operations

    > [!NOTE]
    > Refer to [vcpkg commands](https://learn.microsoft.com/en-us/vcpkg/commands/add) for more details.

    - Package Installation

      > Installs a package.

      ```bash
      vcpkg install <port>
      ```

      > Remove a package.

      ```bash
      vcpkg remove <port>
      ```

      > Rebuilds all outdated packages.

      ```bash
      vcpkg upgrade
      ```

    - Package Discovery

      > Lists installed libraries.

      ```bash
      vcpkg list
      ```

      > Searches for packages available to be built.

      ```bash
      vcpkg search <query>
      ```

      > Lists packages that can be upgraded.

      ```bash
      vcpkg update
      ```

    - Package Manipulation

      > Creates a new manifest.

      ```bash
      vcpkg new <port>
      ```

      > Creates a new port.

      ```bash
      vcpkg create <port>
      ```

      > Adds a dependency to manifest.

      ```bash
      vcpkg add <dependency>
      ```

      > Updates baselines of git registries in a manifest to those registries HEAD commit.

      ```bash
      vcpkg x-update-baseline
      ```

    - Package Miscellaneous

      > Tries building all ports for CI testing.

      ```bash
      vcpkg ci
      ```

      > Displays contact information to send feedback.

      ```bash
      vcpkg contact
      ```

      > Integrates vcpkg with machines, projects, or shells, e.g. vcpkg with CMake (Generate CMake Toolchain File).

      ```bash
      vcpkg integrate install
      ```

#### 1.1.2. Manifest Mode

[Manifest mode](https://learn.microsoft.com/en-us/vcpkg/concepts/manifest-mode) uses declarative JSON files to describe metadata about a project or package in `vcpkg.json` file.

> [!NOTE]
> Manifest mode is required to use advanced features like [versioning](https://learn.microsoft.com/en-us/vcpkg/users/versioning) and [custom registries](#121-registry).

1. Files and Folders

    - `vcpkg.json`
      > `vcpkg.json` is a manifest file used by vcpkg to define the dependencies (vcpkg ports) for a C/C++ project. It lists the packages (libraries) required by the project along with their versions to download and configure for C/C++ project.

      ```json
      {
        "builtin-baseline": "c9919121dde6f61c0436adda94624636e041226b",
        "dependencies": [
          "gtest",
          "argon2"
        ],
        "overrides": [
          {
            "name": "gtest",
            "version-semver": "1.14.0",
            "port-version": 0
          },
          {
            "name": "argon2",
            "version-string": "20190702",
            "port-version": 1
          }
        ]
      }
      ```

    - `CMakeLists.txt`
      > `CMakeLists.txt` is a CMake configuration file that contains instructions for building C/C++ project. It specifies source files, includes directories, compiler options, and, importantly, links the project with the libraries provided by vcpkg.

      > [!NOTE]
      > Usage of `vcpkg` with CMake integrated in `CMakeLists.txt` for building and linking.

      ```cmake
      # Set vcpkg root directory
      set(VCPKG_ROOT "/path/to/vcpkg")

      # Check if VCPKG_ROOT exists
      if(EXISTS ${VCPKG_ROOT})
        set(CMAKE_TOOLCHAIN_FILE
            "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
            CACHE STRING "Vcpkg toolchain file")
      endif()
      ```

    - `CMakePresets.json`
      > `CMakePresets.json` is used to define CMake presets for different build configurations. It helps streamline the build process by providing predefined configurations for different scenarios, which can be inherited in Debug or Release builds.

      > [!NOTE]
      > Usage of `vcpkg` with CMake integrated in `CMakePresets.json` for building and linking instead of the `CMakeLists.txt`.

      ```json
      {
        "version": 6,
        "cmakeMinimumRequired": {
          "major": 3,
          "minor": 23,
          "patch": 0
        },
        "configurePresets": [
          {
            "name": "vcpkg",
            "displayName": "Dependency Manager",
            "description": "C++ Library Manager for Windows, Linux, and MacOS",
            "hidden": true,
            "environment": {
              "VCPKG_ROOT": "$env{HOME}/vcpkg"
            },
            "cacheVariables": {
              "CMAKE_TOOLCHAIN_FILE": "$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
            }
          }
        ]
      }
      ```

##### 1.1.2.1. Versioning

1. Arguments and Options

    - [Version Constraint](https://learn.microsoft.com/en-us/vcpkg/consume/lock-package-versions?tabs=inspect-powershell#4---add-a-minimum-version-constraint)
      > Minimum version constraints in the form of `version>=`.

      Modify vcpkg.json to:

      ```json
      {
        "builtin-baseline": "3426db05b996481ca31e95fff3734cf23e0f51bc",
        "dependencies": [
          {
            "name": "fmt",
            "version>=": "10.1.1"
          }
        ]
      }

    - [Specific Version](https://learn.microsoft.com/en-us/vcpkg/consume/lock-package-versions?tabs=inspect-powershell#5---force-a-specific-version)
      > Force a specific version of a package.

      Modify vcpkg.json to:

      ```json
      {
        "builtin-baseline": "3426db05b996481ca31e95fff3734cf23e0f51bc", 
        "dependencies": [
          "fmt"
        ],
        "overrides": [
          { 
            "name": "fmt", 
            "version": "10.1.1"
          }
        ]
      }
      ```

##### 1.1.2.2. Triplets

[Triplets](https://learn.microsoft.com/en-us/vcpkg/concepts/triplets) are unique identifier that specifies the target platform and configuration for a library or application using a [systematic naming scheme](https://developer.android.com/ndk/guides/standalone_toolchain.html). A triplet is composed of three parts: architecture, operating system, and compiler.

1. Support and Services

    - Architecture
      > The architecture of the target system. For example, `x64`, `x86`, or `arm`.

    - Operating System
      > The operating system for which the library or application is built. For example, `Windows`, `Linux`, or `macOS`.

    - Compiler
      > The build configuration for the library or application. This can be `debug`, `release`, `shared`, `static`, or `dynamic`.

2. Layout and Structure

    - Project Layout
      > Replace `<...>` brackets with the triplet-specific information to create vcpkg `triplets`.

      ```plaintext
      /vcpkg-registry
      └── /triplets
          ├── <architecture>-<system>-<compiler>.cmake
          ├── x64-linux-static.cmake
          ├── x64-linux-dynamic.cmake
          ├── x64-osx.cmake
          └── x86-windows.cmake
      ```

3. Files and Folders

    - `triplets/`
      > Triplets are represented within the `triplets` directory, with each triplet having its own dedicated configuration file.

    - `triplets/x64-linux-static.cmake`
      > `x64-linux-static.cmake` is a triplet configuration file for building `static` libraries on a `Linux` system with `x64` architecture.

      ```cmake
      set(VCPKG_TARGET_ARCHITECTURE x64)
      set(VCPKG_CRT_LINKAGE dynamic)
      set(VCPKG_LIBRARY_LINKAGE static)
      set(VCPKG_CMAKE_SYSTEM_NAME Linux)
      ```

    - `triplets/x64-linux-dynamic.cmake`
      > `x64-linux-dynamic.cmake` is a triplet configuration file for building `dynamic` libraries on a `Linux` system with `x64` architecture.

      ```cmake
      set(VCPKG_TARGET_ARCHITECTURE x64)
      set(VCPKG_CRT_LINKAGE dynamic)
      set(VCPKG_LIBRARY_LINKAGE dynamic)
      set(VCPKG_CMAKE_SYSTEM_NAME Linux)
      ```

##### 1.1.2.3. Binary Cache

[Binary Caching](https://learn.microsoft.com/en-us/vcpkg/users/binarycaching)

> [!NOTE]
> Create a binary cache with read and write permissions for every continuous integration pipeline or workflow. Individual developers should have read-only access to the CI-produced binary cache.

1. Files and Folders

    - `CMakePresets.json`
      > `CMakePresets.json` to configure vcpkg to use an S3 bucket as a binary cache source.

      ```json
      {
        "configurePresets": [
          {
            "name": "vcpkg-s3-cache",
            "configureArgs": [
              "-DVCPKG_BINARY_SOURCES=x-aws,s3://vcpkg-binary-cache/,read"
            ],
            "environment": {
              "AWS_ACCESS_KEY_ID": "<YOUR_ACCESS_KEY_ID>",
              "AWS_SECRET_ACCESS_KEY": "<YOUR_SECRET_ACCESS_KEY>",
            }
          }
        ]
      }
      ```

##### 1.1.2.4. Software Bill of Materials (SBOM)

vcpkg generates a [Software Bill of Materials (SBOM)](https://learn.microsoft.com/en-us/vcpkg/reference/software-bill-of-materials) based on the [Software Package Data Exchange (SPDX)](https://spdx.github.io/spdx-spec/v2.3/) specification. It tracks important information used to build a package, such as source origin, and aims to provide package consumers with software transparency and integrity.

vcpkg generates a SPDX file containing the SBOM information for each package that is installed. The files are located in `<installed_dir>/<triplet>/share/<package name>/vcpkg.spdx.json`. The installation directory depends on whether vcpkg is running on `manifest mode` or classic mode. A package can have different dependencies depending on the target platform, thus the generated files are separated by triplet.

1. Tools and Frameworks

    - [Software Bill of Materials (SBOM)](../articles/software-security.md#1121-software-bill-of-materials-sbom)
      > A collection of tools and frameworks related to `SBOM` within [Software Security](../articles/software-security.md).

    - [Vulnerability Analysis](../articles/software-security.md#114-vulnerability-analysis)
      > A collection of `Vulnerability Analysis` tools and frameworks that use SBOM to comprehensively assess and remediate potential security vulnerabilities within [Software Security](../articles/software-security.md).

### 1.2. Vcpkg Registry

[Vcpkg Registry](https://learn.microsoft.com/en-us/vcpkg/concepts/registries) is a package management system for C and C++ libraries. It extends Vcpkg, allowing users to host and consume custom packages not included in the official Vcpkg catalog. Registries enable sharing and distribution of custom libraries within specific projects or organizations.

1. Layout and Structure

    - Project Layout
      > Replace `<...>` brackets with the port-specific information to create a project layout for a vcpkg port.

      ```plaintext
      /vcpkg-registry
      ├── /ports
      │   └── /<port-name>
      │       ├── portfile.cmake
      │       └── vcpkg.json
      │
      └── /versions
          ├── /<first-letter-of-port-name>-
          │   └── <port-name>.json
          └── baseline.json
      ```

2. Files and Folders

    - `ports/`
      > `ports/` is a directory that contains the vcpkg ports. Each port is a directory that contains a `portfile.cmake` file and a `vcpkg.json` file.

    - `ports/<port-name>`
      > `<port-name>` is a directory that contains the build instructions for a library. It specifies the source code location, build options, and other details required to build a library. A port is defined in a `portfile.cmake` file, which is a CMake configuration file that contains instructions for building a vcpkg port.

    - `ports/<port-name>/portfile.cmake`
      > `portfile.cmake` is a CMake configuration file that contains instructions for building a vcpkg port. It specifies source files, includes directories, compiler options, and, importantly, links the project with the libraries provided by vcpkg.

      ```cmake
      vcpkg_from_git(
          OUT_SOURCE_PATH SOURCE_PATH
          URL git@gitlab.net:password.git
          REF 2c50e8b80dc51c07a9136064111b152f2e0afdb1
          HEAD_REF main
      )

      vcpkg_cmake_install()
      vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
      ```

    - `ports/<port-name>/vcpkg.json`
      > `vcpkg.json` is a manifest file used by vcpkg to define the dependencies (vcpkg ports) for a C/C++ project. It lists the packages (libraries) required by the project along with their versions to download and configure for C/C++ project.

      ```json
      {
        "name": "password",
        "version": "1.2.2",
        "port-version": 0,
        "description": "A password hashing algorithm library",
        "homepage": "https://gitlab.net/password",
        "license": "Apache-2.0",
        "dependencies": [
          {
            "name": "vcpkg-cmake",
            "host": true
          },
          {
            "name": "vcpkg-cmake-config",
            "host": true
          }
        ]
      }
      ```

    - `versions/`
      > `versions/` is a directory that contains the versions of the vcpkg ports.

    - `versions/<first-letter-of-port-name>-/`
      > `<first-letter-of-port-name>-/` is a directory that contains the versions of the vcpkg ports. The directory name is the first letter of the port name followed by a hyphen, e.g. assuming the port name is `password`, the directory name is `p-`.

    - `versions/<first-letter-of-port-name>-/<port-name>.json`
      > `<port-name>.json` is a manifest file used by vcpkg to define the versions of a vcpkg port. It lists the versions of the port along with their port-version. The `port-version` is a number that is incremented each time a new version of the port is released.

      > [!NOTE]
      > Vcpkg follows the text format `<version>#<port-version>`. For example `1.2.0#2` means version `1.2.0` port version `2`. If the port version is `0` the `#0` suffix is omitted, e.g. `1.2.0` implies version `1.2.0` port version `0`.

      ```json
      {
        "versions": [
          {
            "git-tree": "dc651f63c98e099eb91c250a104d0781d9a8e283",
            "version": "1.2.2",
            "port-version": 0
          },
          {
            "git-tree": "9411008a843a99978638fff3cbe75f9124bdffab",
            "version": "1.2.1",
            "port-version": 0
          }
        ]
      }
      ```

    - `versions/baseline.json`
      > `baseline.json` is a manifest file used by vcpkg to define the baseline versions of the vcpkg ports. It lists the baseline versions of the ports along with their port-version. The `port-version` is a number that is incremented each time a new version of the port is released, e.g. assuming `1.2.2#0` is the latest version of the `password` port.

      ```json
      {
        "default": {
          "password": {
            "baseline": "1.2.2",
            "port-version": 0
          }
        }
      }
      ```

#### 1.2.1. Registry

##### 1.2.1.1. Ports

A port is a package definition that contains the build instructions for a library. It specifies the source code location, build options, and other details required to build a library. A port is defined in a portfile.cmake file, which is a CMake configuration file that contains instructions for building a vcpkg port.

1. Commands and Operations

    - Create or Update `ports/<port-name>`
      > Create or update `portfile.cmake` and `vcpkg.json` in `ports/<port-name>` directory.

      ```bash
      # Commands
      git add ports/<port-name>
      git commit -m 'feat: create/modify `<port-name>` port'

      # Example
      git add ports/password
      git commit -m 'feat: create `password` port'
      ```

    - Get `git-tree` for `ports/<port-name>`
      > The `git rev-parse` command is used to get the SHA-1 hash of a specific file or directory relative to the HEAD commit. The SHA-1 hash is a unique identifier for the file or directory, and can be used to track changes over time.

      ```bash
      # Commands
      git rev-parse COMMIT-ID:ports/<port-name>

      # Example
      git rev-parse HEAD:ports/password
      > dc651f63c98e099eb91c250a104d0781d9a8e283
      ```

    - Create or Update `versions/`
      > Create or update `<first-letter-of-port-name>-/<port-name>.json` and `baseline.json` in `versions` directory, and add `versions/` to current `git-tree` commit.

      ```json
      {
        // ...
        {
          "git-tree": "dc651f63c98e099eb91c250a104d0781d9a8e283",
          "version": "1.2.2",
          "port-version": 0
        },
        //...
      }
      ```

      ```bash
      git add versions
      git commit --amend --no-edit
      ```

##### 1.2.1.2. Patches

A patch is a file that contains changes to a `portfile.cmake` file. It is used to modify the build instructions for a port. A patch is defined in a patchfile.cmake file, which is a CMake configuration file that contains instructions for patching a vcpkg port.

1. Commands and Operations

    - Create Patch
      > Create a patch file that contains the changes to a `portfile.cmake` file.

      ```bash
      # Commands
      git diff > <patch-name>.patch

      # Example
      git diff > fix-bug.patch
      ```

    - Add Patch
      > In `ports/<port-name>/portfile.cmake` file, add the patch file to the `vcpkg_from_git()` command.

      ```cmake
      vcpkg_from_git(
          OUT_SOURCE_PATH SOURCE_PATH
          URL git@gitlab.net:password.git
          REF 2c50e8b80dc51c07a9136064111b152f2e0afdb1
          HEAD_REF main
          PATCHES
            <patch-name>.patch
            <patch-name>.patch
      )
      ```

    - Update Port and Port Version
      > Follow the [ports](#1211-ports) to update a port and increment the `port-version` in `ports/<port-name>/<port-name>.json`, `versions/<first-letter-of-port-name>-/<port-name>.json` and `versions/baseline.json` file.

      ```json
      {
        // ...
        "port-version": 1,
        //...
      }
      ```

    - `ports/<port-name>/<patch-name>.patch`
      > `<patch-name>.patch` is a CMake configuration file that contains instructions for patching a vcpkg port. It specifies the patch file to apply and the directory to apply it to.

      ```patch
      diff --git a/src/crypto/argon.c b/src/crypto/argon.c
      index 39c8f0e..dd80efa 100644
      --- a/src/crypto/argon.c
      +++ b/src/crypto/argon.c
      @@ -5,21 +5,31 @@
      -int argon_generateSalt(unsigned char *salt) {
      +int argon_generateTRNGSalt(unsigned char *salt) {
      -  srand(time(NULL));
      +  int fd = open("/dev/urandom", O_RDONLY);
      +  if (fd == -1) {
      +    return -1;
      +  }
      
      -  for (int i = 0; i < ARGON2_SALT_SIZE; ++i) {
      +  int bytesRead = read(fd, salt, ARGON2_SALT_SIZE);
      +  if (bytesRead != ARGON2_SALT_SIZE) {
      -    salt[i] = (char)rand() % 256;
      +    close(fd);
      +    return -1;
        }
      
      +  close(fd);
      +
        return 0;
      }
      ```

#### 1.2.2. Templates

##### 1.2.2.1. Library

Modifying a library to support vcpkg is a two-step process. First, the library must be built and packaged as a vcpkg port. Second, the library must be added to a vcpkg registry.

1. Layout and Structure

    - Project Layout
      > Replace `<...>` brackets with the library-specific information.

      ```plaintext
      /<library>
      ├── /inc
      │   └── /<library>
      │       └── file.h
      │
      ├── /src
      │   ├── file.c
      │   ├── file_test.cc
      │   ├── CMakeLists.txt
      │   └── README.md
      │
      ├── CMakeLists.txt
      ├── CMakePresets.json
      ├── LICENSE
      └── README.md
      ```

2. Commands and Operations

    - List Presets
      > List all available presets.

      ```bash
      cmake --list-presets=all .
      ```

    - Configure Presets
      > Configure the project using the specified preset.

      ```bash
      cmake --preset install
      ```

    - Build Presets
      > Build the project using the specified preset.

      ```bash
      cmake --build --preset install
      ```

3. Files and Folders

    - `config.cmake.in`
      > `config.cmake.in` is a template file used by CMake to generate a configuration file (config.cmake) tailored to the specific build environment and requirements of a project. To use the configuration file in another project, use the `find_package()` command with the package name and optionally the `CONFIG` keyword. The `CONFIG` keyword indicates that the package provides its own configuration file.

      ```cmake
      @PACKAGE_INIT@

      include(${CMAKE_CURRENT_LIST_DIR}/@PROJECT_NAME@-targets.cmake)
      check_required_components(@PROJECT_NAME@)
      ```

    - `CMakeLists.txt`
      > `CMakeLists.txt` configuration with install instructions for the library.

      ```cmake
      cmake_minimum_required(VERSION 3.23)

      # Specify project and language
      project(password)

      add_library(${PROJECT_NAME})
      add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

      # Definitions of CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR and others
      include(GNUInstallDirs)

      # Include directories
      target_include_directories(
        ${PROJECT_NAME}
        PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
              $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
              $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

      # Specify the required C++ standard for this target
      target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)

      include(CMakePackageConfigHelpers)

      set(PACKAGE_VERSION "1.2.2")

      # Generate the version file for the configuration file
      write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake"
        VERSION "${PACKAGE_VERSION}"
        COMPATIBILITY SameMajorVersion)

      # Generate the configuration file
      configure_package_config_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/scripts/cmake/config.cmake.in"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
        INSTALL_DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")

      # Install config files
      install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake"
        DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")

      # Support dependency manager
      install(TARGETS ${PROJECT_NAME} EXPORT "${PROJECT_NAME}-targets")

      install(DIRECTORY inc/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

      # Generate and install export file
      install(
        EXPORT "${PROJECT_NAME}-targets"
        FILE "${PROJECT_NAME}-targets.cmake"
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")
      ```

    - `CMakeLists.txt`
      > `CMakeLists.txt` is a CMake configuration file that contains instructions for building C/C++ project. It specifies source files, includes directories, compiler options, and, importantly, links the project with the libraries provided by vcpkg.

      ```json
      {
        "version": 6,
        "cmakeMinimumRequired": {
          "major": 3,
          "minor": 23,
          "patch": 0
        },
        "configurePresets": [
          {
            "name": "vcpkg",
            "displayName": "Dependency Manager",
            "description": "C++ Library Manager for Windows, Linux, and MacOS",
            "hidden": true,
            "environment": {
              "VCPKG_ROOT": "$env{HOME}/vcpkg"
            },
            "cacheVariables": {
              "VCPKG_INSTALLED_DIR": "${sourceDir}/external",
              "CMAKE_TOOLCHAIN_FILE": "$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
            }
          },
          {
            "name": "default",
            "displayName": "Default Configuration",
            "description": "Default configuration with Ninja generator",
            "hidden": true,
            "generator": "Ninja",
            "binaryDir": "${sourceDir}/build/${presetName}",
            "cacheVariables": {
              "CMAKE_C_COMPILER": "gcc",
              "CMAKE_CXX_COMPILER": "g++",
              "CMAKE_ARCHIVE_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/lib",
              "CMAKE_LIBRARY_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/lib",
              "CMAKE_RUNTIME_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/bin",
              "CMAKE_EXPORT_COMPILE_COMMANDS": true
            },
            "inherits": [
              "vcpkg"
            ]
          },
          {
            "name": "install",
            "displayName": "Install",
            "description": "Configuration with install information",
            "cacheVariables": {
              "CMAKE_BUILD_TYPE": "Release"
            },
            "inherits": [
              "default"
            ]
          }
        ],
        "buildPresets": [
          {
            "name": "install",
            "description": "Install GNU (Release) using VCPKG",
            "configurePreset": "install",
            "configuration": "Install",
            "targets": [
              "install"
            ]
          }
        ]
      }
      ```

##### 1.2.2.2. Application

A vcpkg application is a C/C++ project that uses vcpkg to manage its dependencies. It can be built and run using the `cmake` command.

1. Layout and Structure

    - Project Layout
      > Replace `<...>` brackets with the project-specific information.

      ```plaintext
      /<project>
      ├── /internal
      │   ├── main.c
      │   └── CMakeLists.txt
      │
      ├── CMakeLists.txt
      ├── CMakePresets.json
      ├── vcpkg.json
      ├── vcpkg-configuration.json
      ├── LICENSE
      └── README.md
      ```

2. Commands and Operations

    - List Presets
      > List all available presets.

      ```bash
      cmake --list-presets=all .
      ```

    - Configure Presets
      > Configure the project using the specified preset.

      ```bash
      cmake --preset <configurePreset-name>
      ```

    - Build Presets
      > Build the project using the specified preset.

      ```bash
      cmake --build --preset <buildPreset-name>
      ```

3. Files and Folders

    - `vcpkg.json`
      > `vcpkg.json` is a manifest file used by vcpkg to define the dependencies (vcpkg ports) for a C/C++ project. It lists the packages (libraries) required by the project along with their versions to download and configure for C/C++ project.

      ```json
      {
        "dependencies": [
          "password"
        ],
        "overrides": [
          {
            "name": "password",
            "version": "1.2.2",
            "port-version": 0
          }
        ]
      }
      ```

    - `vcpkg-configuration.json`
      > `vcpkg-configuration.json` is a manifest file used by vcpkg to define the registries for a C/C++ project. It lists the registries (vcpkg-registry) required by the project along with their versions to download and configure for C/C++ project.

      ```json
      {
        "default-registry": {
          "kind": "git",
          "baseline": "45c8b198b7647b6a68235353a00839082c910914",
          "repository": "https://github.com/microsoft/vcpkg"
        },
        "registries": [
          {
            "kind": "git",
            "baseline": "335b9b4f1ecfcb43c24d493b6791c28c7d99c884",
            "repository": "git@gitlab.net:vcpkg-registry.git",
            "packages": [
              "password"
            ]
          }
        ]
      }
      ```

    - `CMakeLists.txt`
      > `CMakeLists.txt` is a CMake configuration file that contains instructions for building C/C++ project. It specifies source files, includes directories, compiler options, and, importantly, links the project with the libraries provided by vcpkg.

      > [!NOTE]
      > Usage of `vcpkg` ports in CMake with `CMakeLists.txt` for building and linking.

      ```cmake
      cmake_minimum_required(VERSION 3.23)

      project(vcpkg-project CXX)

      add_executable(${PROJECT_NAME})

      find_package(password CONFIG REQUIRED)

      target_link_libraries(${PROJECT_NAME} PRIVATE password::password)

      add_subdirectory(internal)
      ```

    - `CMakePresets.json`
      > `CMakePresets.json` is used to define CMake presets for different build configurations. It helps streamline the build process by providing predefined configurations for different scenarios, which can be inherited in Debug or Release builds.

      > [!NOTE]
      >Integration of `vcpkg` dependency manager into CMake with `CMakePresets.json` for configuration building and linking process.

      ```json
      {
        "version": 6,
        "cmakeMinimumRequired": {
          "major": 3,
          "minor": 23,
          "patch": 0
        },
        "configurePresets": [
          {
            "name": "vcpkg",
            "displayName": "Dependency Manager",
            "description": "C++ Library Manager for Windows, Linux, and MacOS",
            "hidden": true,
            "environment": {
              "VCPKG_ROOT": "$env{HOME}/vcpkg"
            },
            "cacheVariables": {
              "VCPKG_INSTALLED_DIR": "${sourceDir}/external",
              "CMAKE_TOOLCHAIN_FILE": "$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
            }
          },
          {
            "name": "default",
            "displayName": "Default Configuration",
            "description": "Default configuration with Ninja generator",
            "hidden": true,
            "generator": "Ninja",
            "binaryDir": "${sourceDir}/build/${presetName}",
            "cacheVariables": {
              "CMAKE_CXX_COMPILER": "g++",
              "CMAKE_ARCHIVE_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/lib",
              "CMAKE_LIBRARY_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/lib",
              "CMAKE_RUNTIME_OUTPUT_DIRECTORY": "${sourceDir}/build/${presetName}/bin",
              "CMAKE_EXPORT_COMPILE_COMMANDS": true
            },
            "inherits": [
              "vcpkg"
            ]
          },
          {
            "name": "release",
            "displayName": "Release",
            "description": "Configuration with release optimization",
            "cacheVariables": {
              "CMAKE_BUILD_TYPE": "Release"
            },
            "inherits": [
              "default"
            ]
          }
        ],
        "buildPresets": [
          {
            "name": "release",
            "description": "Build GNU (Release) using VCPKG",
            "configurePreset": "release",
            "configuration": "Release",
            "targets": [
              "all"
            ]
          }
        ]
      }
      ```

## 2. References

- Vcpkg [Documentation](https://learn.microsoft.com/en-us/vcpkg/) page.
- CMake [Documentation](https://cmake.org/documentation/) page.
