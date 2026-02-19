# Build Systems

Build systems are tools to automate the process of compiling source code, managing dependencies, and generating executable artifacts.

- [1. Category](#1-category)
  - [1.1. Make](#11-make)
  - [1.2. CMake](#12-cmake)
  - [1.3. Gradle](#13-gradle)
  - [1.4. Maven](#14-maven)
  - [1.5. Ant](#15-ant)
  - [1.6. Bazel](#16-bazel)
  - [1.7. Ninja](#17-ninja)

## 1. Category

### 1.1. Make

[Make](https://www.gnu.org/software/make/) is a build system in Unix-like environments to build targets from rules declared in a `Makefile`, and updates only what is out of date based on file dependencies and timestamps.

> [!NOTE]
> `Makefile` recipes require **tab indentation** (not spaces).

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── Makefile
    └── src/
        ├── main.c
        ├── utility.c
        └── utility.h
    ```

2. Files and Folders

    - `Makefile`
      > Root build definition. Declares targets, dependencies, compiler flags, and utility targets such as `clean`.

      ```makefile
      CC = gcc
      CFLAGS = -Wall -Wextra -Werror -std=c11
      TARGET = myprogram
      OBJ = main.o utility.o
      TAB := $(shell printf '\t')

      .PHONY: all clean

      all: $(TARGET)

      $(TARGET): $(OBJ)
      $(TAB)$(CC) $(CFLAGS) -o $@ $^

      main.o: src/main.c src/utility.h
      $(TAB)$(CC) $(CFLAGS) -c $< -o $@

      utility.o: src/utility.c src/utility.h
      $(TAB)$(CC) $(CFLAGS) -c $< -o $@

      clean:
      $(TAB)rm -f $(OBJ) $(TARGET)
      ```

    - `src/main.c`
      > Entry point that calls functionality from `utility`.

      ```c
      #include <stdio.h>

      #include "utility.h"

      int main(void) {
          puts(greet("Make"));
          return 0;
      }
      ```

    - `src/utility.c`
      > Implementation file for reusable helper functions.

      ```c
      #include <stdio.h>

      #include "utility.h"

      const char* greet(const char* name) {
          static char buffer[64];
          snprintf(buffer, sizeof(buffer), "Hello, %s!", name);
          return buffer;
      }
      ```

    - `src/utility.h`
      > Public declarations shared between translation units.

      ```c
      #pragma once

      const char* greet(const char* name);
      ```

3. Instructions and Commands

    - Build
      > Compile and link the default target.

      ```shell
      make
      ```

    - Run
      > Execute the generated binary.

      ```shell
      ./myprogram
      ```

    - Clean
      > Remove generated objects and binaries.

      ```shell
      make clean
      ```

### 1.2. CMake

[CMake](https://cmake.org/) is a cross-platform build system generator for C, C++, and other languages. Modern CMake emphasizes **target-based design** (properties, include paths, and links attached to targets), reproducible configuration via **CMake presets**, and clear separation of source and build trees.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── CMakeLists.txt
    ├── CMakePresets.json
    ├── include/
    │   └── foo/
    │       └── foo.hpp
    └── src/
        ├── CMakeLists.txt
        ├── app/
        │   ├── CMakeLists.txt
        │   └── main.cpp
        └── foo/
            ├── CMakeLists.txt
            └── foo.cpp
    ```

2. Files and Folders

    - `CMakeLists.txt`
      > Root build entry point. Defines global project metadata and includes subdirectories. Keep this file small and delegate target definitions to child directories.

      ```cmake
      cmake_minimum_required(VERSION 3.30)

      project(MyProject VERSION 1.0.0 LANGUAGES CXX)

      set(CMAKE_CXX_STANDARD 20)
      set(CMAKE_CXX_STANDARD_REQUIRED ON)
      set(CMAKE_CXX_EXTENSIONS OFF)

      add_subdirectory(src)
      ```

    - `CMakePresets.json`
      > Standardized, shareable configure/build presets. Improves reproducibility across local machines and CI.

      ```json
      {
        "version": 7,
        "cmakeMinimumRequired": {
          "major": 3,
          "minor": 30,
          "patch": 0
        },
        "configurePresets": [
          {
            "name": "dev-debug",
            "displayName": "Development Debug",
            "generator": "Ninja",
            "binaryDir": "${sourceDir}/build/${presetName}",
            "cacheVariables": {
              "CMAKE_EXPORT_COMPILE_COMMANDS": true,
              "CMAKE_BUILD_TYPE": "Debug"
            }
          },
          {
            "name": "dev-release",
            "displayName": "Development Release",
            "generator": "Ninja",
            "binaryDir": "${sourceDir}/build/${presetName}",
            "cacheVariables": {
              "CMAKE_EXPORT_COMPILE_COMMANDS": true,
              "CMAKE_BUILD_TYPE": "Release"
            }
          }
        ],
        "buildPresets": [
          {
            "name": "build-debug",
            "configurePreset": "dev-debug"
          },
          {
            "name": "build-release",
            "configurePreset": "dev-release"
          }
        ]
      }
      ```

    - `src/CMakeLists.txt`
      > Aggregates subdirectories that define their own targets and dependencies.

      ```cmake
      add_subdirectory(foo)
      add_subdirectory(app)
      ```

    - `src/app/CMakeLists.txt`
      > Defines executable and links against internal library targets.

      ```cmake
      add_executable(app main.cpp)

      target_link_libraries(app
        PRIVATE
          foo
      )

      target_compile_features(app PRIVATE cxx_std_20)
      ```

    - `src/foo/CMakeLists.txt`
      > Defines a reusable library and publishes the root-level `include/` directory with proper visibility.

      ```cmake
      add_library(foo foo.cpp)

      target_include_directories(foo
        PUBLIC
          $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
          $<INSTALL_INTERFACE:include>
      )

      target_compile_features(foo PUBLIC cxx_std_20)
      ```

    - `src/app/main.cpp`
      > Application entry point that consumes the `foo` library using a namespaced include path (`foo/foo.hpp`).

      ```cpp
      #include <iostream>

      #include "foo/foo.hpp"

      int main() {
          std::cout << foo::greet("CMake") << '\n';
          return 0;
      }
      ```

    - `src/foo/foo.cpp`
      > Implementation for the library API.

      ```cpp
      #include "foo/foo.hpp"

      namespace foo {

      std::string greet(const std::string& name) {
          return "Hello, " + name + "!";
      }

      }  // namespace foo
      ```

    - `include/foo/foo.hpp`
      > Public header for the `foo` library target. When installed this header should be available as `foo/foo.hpp` so consumers use namespaced includes.

      ```cpp
      #pragma once

      #include <string>

      namespace foo {

      std::string greet(const std::string& name);

      }  // namespace foo
      ```

3. Instructions and Commands

    - Configure
      > Configure the project using the debug preset.

      ```shell
      cmake --preset dev-debug
      ```

    - Build
      > Build all targets defined by the selected preset.

      ```shell
      cmake --build --preset build-debug
      ```

    - Run
      > Execute the generated binary from the build tree.

      ```shell
      ./build/dev-debug/src/app/app
      ```

    - Clean
      > Remove generated artifacts by deleting the build directory.

      ```shell
      rm -rf build/
      ```

### 1.3. Gradle

[Gradle](https://gradle.org/) is a build automation tool commonly used for Java, Kotlin, and Android projects. It uses a declarative build model and supports dependency management, incremental builds, and task orchestration.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── settings.gradle
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

2. Files and Folders

    - `settings.gradle`
      > Declares the root project name and included modules.

      ```groovy
      rootProject.name = 'MyProject'
      ```

    - `build.gradle`
      > Defines plugins, dependencies, Java toolchain settings, and custom tasks.

      ```groovy
      plugins {
          id 'application'
      }

      group = 'com.example'
      version = '1.0.0'

      repositories {
          mavenCentral()
      }

      java {
          toolchain {
              languageVersion = JavaLanguageVersion.of(21)
          }
      }

      dependencies {
          implementation 'com.google.guava:guava:33.4.8-jre'
          testImplementation 'org.junit.jupiter:junit-jupiter:5.12.0'
      }

      application {
          mainClass = 'com.example.MyApplication'
      }

      tasks.test {
          useJUnitPlatform()
      }
      ```

    - `src/main/java/com/example/MyApplication.java`
      > Application entry point.

      ```java
      package com.example;

      public class MyApplication {
          public static void main(String[] args) {
              System.out.println("Hello, Gradle!");
          }
      }
      ```

    - `src/test/java/com/example/MyApplicationTest.java`
      > Unit test verifying basic behavior.

      ```java
      package com.example;

      import org.junit.jupiter.api.Test;

      import static org.junit.jupiter.api.Assertions.assertTrue;

      class MyApplicationTest {
          @Test
          void smokeTest() {
              assertTrue(true);
          }
      }
      ```

3. Instructions and Commands

    - Build
      > Compile and package the project.

      ```shell
      ./gradlew build
      ```

    - Run
      > Execute the application configured by the `application` plugin.

      ```shell
      ./gradlew run
      ```

    - Test
      > Run unit tests.

      ```shell
      ./gradlew test
      ```

    - Clean
      > Remove generated build outputs.

      ```shell
      ./gradlew clean
      ```

### 1.4. Maven

[Maven](https://maven.apache.org/) is a build and dependency management tool for Java projects. It uses a standardized project layout and a lifecycle-based model configured through `pom.xml`.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── pom.xml
    └── src
        ├── main
        │   └── java
        │       └── com/
        │           └── example/
        │               └── MyApp.java
        └── test/
            └── java/
                └── com/
                    └── example/
                        └── MyAppTest.java
    ```

2. Files and Folders

    - `pom.xml`
      > Project Object Model (POM) file that defines coordinates, Java version, dependencies, and plugins.

      ```xml
      <project xmlns="http://maven.apache.org/POM/4.0.0"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
          <modelVersion>4.0.0</modelVersion>

          <groupId>com.example</groupId>
          <artifactId>myproject</artifactId>
          <version>1.0.0</version>

          <properties>
              <maven.compiler.release>21</maven.compiler.release>
              <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
          </properties>

          <dependencies>
              <dependency>
                  <groupId>org.junit.jupiter</groupId>
                  <artifactId>junit-jupiter</artifactId>
                  <version>5.12.0</version>
                  <scope>test</scope>
              </dependency>
          </dependencies>

          <build>
              <plugins>
                  <plugin>
                      <groupId>org.apache.maven.plugins</groupId>
                      <artifactId>maven-surefire-plugin</artifactId>
                      <version>3.5.2</version>
                  </plugin>
              </plugins>
          </build>
      </project>
      ```

    - `src/main/java/com/example/MyApp.java`
      > Main class for the application.

      ```java
      package com.example;

      public class MyApp {
          public static void main(String[] args) {
              System.out.println("Hello, Maven!");
          }
      }
      ```

    - `src/test/java/com/example/MyAppTest.java`
      > Unit test class.

      ```java
      package com.example;

      import org.junit.jupiter.api.Test;

      import static org.junit.jupiter.api.Assertions.assertTrue;

      class MyAppTest {
          @Test
          void smokeTest() {
              assertTrue(true);
          }
      }
      ```

3. Instructions and Commands

    - Build
      > Compile, test, and package the project.

      ```shell
      mvn clean package
      ```

    - Run Tests
      > Execute the test phase only.

      ```shell
      mvn test
      ```

    - Clean
      > Remove generated artifacts.

      ```shell
      mvn clean
      ```

### 1.5. Ant

[Ant (Another Neat Tool)](https://ant.apache.org/) is an XML-based Java build tool. It provides explicit control over build steps through named targets and dependencies.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── build.xml
    └── src/
        └── com/
            └── example/
                └── MyApp.java
    ```

2. Files and Folders

    - `build.xml`
      > Main Ant script that defines properties and targets such as `clean`, `compile`, and `jar`.

      ```xml
      <project name="MyProject" default="build">
          <property name="src.dir" value="src"/>
          <property name="build.dir" value="build"/>
          <property name="dist.dir" value="dist"/>

          <target name="clean">
              <delete dir="${build.dir}"/>
              <delete dir="${dist.dir}"/>
          </target>

          <target name="compile" depends="clean">
              <mkdir dir="${build.dir}"/>
              <javac srcdir="${src.dir}" destdir="${build.dir}" includeantruntime="false"/>
          </target>

          <target name="jar" depends="compile">
              <mkdir dir="${dist.dir}"/>
              <jar destfile="${dist.dir}/MyProject.jar" basedir="${build.dir}">
                  <manifest>
                      <attribute name="Main-Class" value="com.example.MyApp"/>
                  </manifest>
              </jar>
          </target>

          <target name="build" depends="jar"/>
      </project>
      ```

    - `src/com/example/MyApp.java`
      > Application entry point.

      ```java
      package com.example;

      public class MyApp {
          public static void main(String[] args) {
              System.out.println("Hello, Ant!");
          }
      }
      ```

3. Instructions and Commands

    - Build
      > Run the default target (`build`), which compiles and packages the JAR.

      ```shell
      ant
      ```

    - Run
      > Execute the generated JAR.

      ```shell
      java -jar dist/MyProject.jar
      ```

    - Clean
      > Remove generated build and distribution directories.

      ```shell
      ant clean
      ```

### 1.6. Bazel

[Bazel](https://bazel.build/) is a scalable build system designed for monorepos and multi-language projects. It uses declarative targets, strict dependency graphs, and aggressive caching for reproducible builds.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── WORKSPACE
    ├── BUILD
    └── src/
        ├── BUILD
        ├── main.cc
        ├── lib.cc
        └── lib.h
    ```

2. Files and Folders

    - `WORKSPACE`
      > Declares the workspace and external dependencies.

      ```python
      workspace(name = "myproject")
      ```

    - `BUILD`
      > Defines top-level targets such as executables and their dependencies.

      ```python
      cc_binary(
          name = "myapp",
          srcs = ["src/main.cc"],
          deps = ["//src:mylib"],
      )
      ```

    - `src/BUILD`
      > Defines package-level library targets.

      ```python
      cc_library(
          name = "mylib",
          srcs = ["lib.cc"],
          hdrs = ["lib.h"],
          visibility = ["//visibility:public"],
      )
      ```

    - `src/main.cc`
      > Entry point that consumes the internal library.

      ```cpp
      #include <iostream>

      #include "src/lib.h"

      int main() {
          std::cout << greet("Bazel") << '\n';
          return 0;
      }
      ```

3. Instructions and Commands

    - Build
      > Build the binary target.

      ```shell
      bazel build //:myapp
      ```

    - Run
      > Build and run the binary target.

      ```shell
      bazel run //:myapp
      ```

    - Clean
      > Remove Bazel output state (expensive, use only when needed).

      ```shell
      bazel clean
      ```

### 1.7. Ninja

[Ninja](https://ninja-build.org/) is a fast, low-level build system focused on minimal overhead and fast incremental rebuilds. It is commonly used as an execution backend generated by tools such as CMake and Meson.

> [!NOTE]
> Ninja relies on external tools to generate the `build.ninja` file that declares rules and targets.

1. Project Layout and Directory Structure

    ```plaintext
    .
    ├── build.ninja
    └── src/
        └── main.cpp
    ```

2. Files and Folders

    - `build.ninja`
      > Declares variables, rules, and targets used by the Ninja executor.

      ```ninja
      cxx = g++
      cxxflags = -std=c++20 -Wall -Wextra -Werror

      rule compile
        command = $cxx $cxxflags -c $in -o $out
        description = CXX $out

      rule link
        command = $cxx $in -o $out
        description = LINK $out

      build obj/main.o: compile src/main.cpp
      build bin/myapp: link obj/main.o

      default bin/myapp
      ```

    - `src/main.cpp`
      > Minimal source file compiled by Ninja.

      ```cpp
      #include <iostream>

      int main() {
          std::cout << "Hello, Ninja!\n";
          return 0;
      }
      ```

3. Instructions and Commands

    - Build
      > Execute the default target.

      ```shell
      ninja
      ```

    - Run
      > Execute the generated binary.

      ```shell
      ./bin/myapp
      ```

    - Clean
      > Remove generated outputs known to Ninja.

      ```shell
      ninja -t clean
      ```
