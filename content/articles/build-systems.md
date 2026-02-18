# Build Systems

A build system is a software tool or framework that automates the process of compiling source code into executable software or other target artifacts. It helps manage the dependencies, configurations, and tasks required to build a software project.

- [1. Category](#1-category)
  - [1.1. Make](#11-make)
  - [1.2. CMake](#12-cmake)
  - [1.3. Gradle](#13-gradle)
  - [1.4. Maven](#14-maven)
  - [1.5. Ant](#15-ant)
  - [1.6. Bazel](#16-bazel)
  - [1.7. Ninja](#17-ninja)
- [2. Terminology](#2-terminology)
- [3. References](#3-references)

## 1. Category

### 1.1. Make

[Make](https://www.gnu.org/software/make/) is a build automation tool that uses makefiles to define rules and dependencies for compiling source code into executables and libraries.

> [!NOTE]
> Makefiles use indentation with tabs (not spaces), so ensure that your text editor is configured to use tabs for indentation to avoid any issues.

1. Project Structure

    ```txt
    MyProject/
    ├── Makefile
    ├── src/
    │   ├── main.c
    │   └── utility.c
    └── (other directories or files, if any)
    ```

2. Build Configuration

    ```makefile
    CC = gcc
    CFLAGS = -Wall -Werror
    
    all: myprogram
    
    myprogram: main.o utility.o
        $(CC) $(CFLAGS) -o myprogram main.o utility.o
    
    main.o: main.c
        $(CC) $(CFLAGS) -c main.c
    
    utility.o: utility.c
        $(CC) $(CFLAGS) -c utility.c
    
    clean:
        rm -f *.o
    ```

3. Build Operations

    - Build the project

      ```bash
      make
      ```

      Make will read the makefile, analyze the dependencies, and execute the necessary commands to build the project.

    - Clean build artifacts

      ```bash
      make clean
      ```

      This target will remove the built artifacts, such as the object files.

### 1.2. CMake

[CMake](https://cmake.org/) is a cross-platform build system generator that creates build files for Make, Ninja, Visual Studio, and other build tools.

1. Project Structure

    ```txt
    MyProject/
    ├── CMakeLists.txt
    ├── src/
    │   ├── main.cpp
    │   └── utility.cpp
    └── include/
        └── (header files, if any)
    ```

2. Build Configuration

    ```cmake
    cmake_minimum_required(VERSION 3.21)
    project(MyProject)

    # Set C++ standard to C++11
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

    # Add source files
    set(SOURCES
        src/main.cpp
        src/utility.cpp
    )

    # Add an executable target
    add_executable(MyExecutable ${SOURCES})

    # Set include directories
    target_include_directories(MyExecutable
        PRIVATE include
    )
    ```

3. Configuration Components

    - `cmake_minimum_required(VERSION 3.21)` sets the minimum required CMake version.
    - `project(MyProject)` specifies the project name.
    - `set(CMAKE_CXX_STANDARD 11)` configures the C++ standard to C++11.
    - `add_executable(MyExecutable ${SOURCES})` creates an executable target from the specified source files.
    - `target_include_directories(MyExecutable PRIVATE include)` adds the include directory to the target.

### 1.3. Gradle

[Gradle](https://gradle.org/) is a build automation framework for Java and Android projects that uses a Groovy-based domain-specific language for build scripts.

1. Project Structure

    ```txt
    MyProject/
    ├── build.gradle
    └── src/
        ├── main/
        │   └── java/
        │       └── com/
        │           └── example/
        │               └── MyApplication.java
        └── test/
            └── java/
                └── com/
                    └── example/
                        └── MyApplicationTest.java
    ```

2. Build Configuration

    ```groovy
    plugins {
        id 'java'
    }

    group 'com.example'
    version '1.0.0'

    repositories {
        mavenCentral()
    }

    dependencies {
        implementation 'com.google.guava:guava:30.1-jre'
        testImplementation 'junit:junit:4.13.2'
    }

    tasks.test {
        useJUnit()
    }

    task runApplication(type: JavaExec) {
        mainClassName = 'com.example.MyApplication'
        classpath = sourceSets.main.runtimeClasspath
    }
    ```

3. Configuration Components

    - `plugins` block specifies the plugins to be applied, such as the `java` plugin for compilation and testing.
    - `group` and `version` define the project's coordinates for artifact identification.
    - `repositories` block configures where Gradle looks for dependencies, using `mavenCentral()` as the repository.
    - `dependencies` block declares project dependencies with scopes like `implementation` and `testImplementation`.
    - `tasks.test` configures the test task to use JUnit for testing.
    - `task runApplication` defines a custom task to execute the main Java class.

### 1.4. Maven

[Maven](https://maven.apache.org/) is a build automation tool for Java projects that uses the Project Object Model (POM) approach and emphasizes convention over configuration.

1. Project Structure

    ```txt
    MyProject/
    ├── src/
    │   ├── main/
    │   │   └── java/
    │   │       └── com/
    │   │           └── example/
    │   │               └── MyApp.java
    │   └── test/
    │       └── java/
    │           └── com/
    │               └── example/
    │                   └── MyAppTest.java
    └── pom.xml
    ```

2. Build Configuration

    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    
        <modelVersion>4.0.0</modelVersion>
        <groupId>com.example</groupId>
        <artifactId>MyProject</artifactId>
        <version>1.0.0</version>
        
        <properties>
            <maven.compiler.source>1.8</maven.compiler.source>
            <maven.compiler.target>1.8</maven.compiler.target>
        </properties>
        
        <dependencies>
            <dependency>
                <groupId>junit</groupId>
                <artifactId>junit</artifactId>
                <version>4.13.2</version>
                <scope>test</scope>
            </dependency>
        </dependencies>
        
    </project>
    ```

3. Configuration Components

    - `<groupId>`, `<artifactId>`, and `<version>` define the project's coordinates for artifact identification.
    - `<properties>` section defines properties that can be referenced throughout the POM, such as Java version settings.
    - `<dependencies>` section declares project dependencies with specified versions and scopes.

### 1.5. Ant

[Ant (Another Neat Tool)](https://ant.apache.org/) is a Java-based build system that uses XML-based build scripts for flexible and customizable build processes.

1. Project Structure

    ```txt
    MyProject/
    ├── build.xml
    └── src/
        └── com/
            └── example/
                └── MyApp.java
    ```

2. Build Configuration

    ```xml
    <project name="MyProject" default="build">

        <!-- Define properties -->
        <property name="src.dir" value="src"/>
        <property name="build.dir" value="build"/>
        <property name="dist.dir" value="dist"/>

        <!-- Clean the build directory -->
        <target name="clean">
            <delete dir="${build.dir}"/>
            <delete dir="${dist.dir}"/>
        </target>

        <!-- Compile Java source files -->
        <target name="compile" depends="clean">
            <mkdir dir="${build.dir}"/>
            <javac srcdir="${src.dir}" destdir="${build.dir}"/>
        </target>

        <!-- Create a JAR file -->
        <target name="jar" depends="compile">
            <mkdir dir="${dist.dir}"/>
            <jar destfile="${dist.dir}/MyProject.jar" basedir="${build.dir}">
                <manifest>
                    <attribute name="Main-Class" value="com.example.MyApp"/>
                </manifest>
            </jar>
        </target>

        <!-- Default target -->
        <target name="build" depends="jar"/>

    </project>
    ```

3. Configuration Components

    - `<project>` defines the root element with the project name and default target.
    - `<property>` elements define reusable properties for directory paths.
    - `<target>` elements represent specific build actions with dependencies on other targets.
    - `clean` target removes build and distribution directories for a clean build environment.
    - `compile` target creates the build directory and compiles Java source files.
    - `jar` target packages compiled classes into a JAR file with a manifest.
    - `build` target serves as the default, executing the full build workflow.

### 1.6. Bazel

[Bazel](https://bazel.build/) is a scalable build system developed by Google that supports multi-language projects with declarative build definitions.

1. Project Structure

    ```txt
    MyProject/
    ├── WORKSPACE
    ├── BUILD
    └── src/
        ├── main.cc
        └── BUILD
    ```

2. Build Configuration

    - WORKSPACE

      ```python
      workspace(name = "MyProject")

      # External dependency declarations
      load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

      http_archive(
          name = "googletest",
          url = "https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip",
          sha256 = "9be78e475e8e262ecf1a1a205ffe05db9e6a65b7003d6b2cccbc960c5e7ed23e",
          strip_prefix = "googletest-release-1.11.0",
      )
      ```

    - BUILD

      ```python
      cc_binary(
          name = "myapp",
          srcs = ["main.cc"],
          deps = ["@googletest//:gtest_main"],
      )
      ```

    - src/BUILD

      ```python
      cc_library(
          name = "mylib",
          srcs = ["main.cc"],
          hdrs = ["main.h"],
          visibility = ["//src:__pkg__"],
      )
      ```

3. Configuration Components

    - `WORKSPACE` file defines the project workspace and external dependencies using `http_archive` for remote repositories.
    - `BUILD` files specify build targets using rules like `cc_binary` for executables and `cc_library` for libraries.
    - `srcs` attribute declares source files for the build target.
    - `deps` attribute specifies dependencies on other targets or external packages.
    - `visibility` attribute controls which packages can depend on the target.

### 1.7. Ninja

[Ninja](https://ninja-build.org/) is a fast build system focused on speed and minimal overhead, commonly used as a backend for CMake and Meson.

> [!NOTE]
> Ninja build files are typically generated by higher-level build systems such as CMake or Meson.

1. Project Structure

    ```txt
    MyProject/
    ├── build.ninja
    └── src/
        └── main.cpp
    ```

2. Build Configuration

    ```ninja
    # Define variables
    CXX = g++
    CXXFLAGS = -std=c++11 -Wall

    # Define build rules
    rule compile
        command = $CXX $CXXFLAGS -c $in -o $out
        description = Compiling $in

    rule link
        command = $CXX $in -o $out
        description = Linking $out

    # Define build targets
    build obj/main.o: compile src/main.cpp
    build bin/myapp: link obj/main.o

    # Phony target for clean
    build clean:
        command = rm -rf obj bin
        description = Cleaning build artifacts
    ```

3. Configuration Components

    - Variables like `CXX` and `CXXFLAGS` define compiler settings.
    - `rule` statements define how to perform build operations with commands and descriptions.
    - `build` statements associate source files with rules to create targets.
    - Phony targets like `clean` define commands that are not associated with output files.

4. Build Operations

    - Build the project

      ```bash
      ninja
      ```

      Ninja will execute the build steps defined in the file, compiling source files and linking the executable.

## 2. Terminology

- Build System
  > A software tool or framework that automates the process of compiling source code into executable software or other target artifacts.

- Makefile
  > A text file containing rules and instructions for building projects, used by Make to determine which parts of a program need to be recompiled.

- Build Target
  > A specific output or action defined in a build configuration, such as an executable, library, or clean operation.

- Dependency Management
  > The process of handling and organizing software dependencies to ensure that all required libraries and packages are available and compatible.

- Incremental Build
  > A build process that only recompiles the parts of a project that have changed since the last build, improving efficiency.

- Build Automation
  > The use of tools and scripts to automatically compile, test, and deploy software without manual intervention.

- Build Script
  > A file containing commands and configurations that define how a project should be compiled and built.

- Cross-Platform Build
  > A build system capability that allows software to be compiled for multiple operating systems or platforms.

- Build Configuration
  > A set of parameters and settings that define how a project is built, including compiler flags, target platforms, and optimization levels.

- Build Artifact
  > The output produced by a build system, such as executable files, libraries, or packages.

## 3. References

- GNU [Make](https://www.gnu.org/software/make/) page.
- [CMake](https://cmake.org/) documentation.
- [Gradle](https://gradle.org/) documentation.
- Apache [Maven](https://maven.apache.org/) page.
- Apache [Ant](https://ant.apache.org/) page.
- [Bazel](https://bazel.build/) documentation.
- [Ninja](https://ninja-build.org/) page.
