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

## 1. Category

### 1.1. Make

[Make](https://www.gnu.org/software/make/) is a widely used build system primarily found in Unix-based systems. It automates the process of compiling source code into executable programs or libraries. Make relies on makefiles, which are text files containing rules and instructions for building the project.

Make provides various features, such as automatic dependency tracking and support for variables and macros. It allows to create complex build systems with multiple targets and conditional compilation. Makefiles can be customized to suit the specific requirements of your project.

> NOTE Makefiles use indentation with tabs (not spaces), so ensure that your text editor is configured to use tabs for indentation to avoid any issues.

Example of Make:

- Structure

  ```txt
  MyProject/
  ├── Makefile
  ├── src/
  │   ├── main.c
  │   └── utility.c
  └── (other directories or files, if any)
  ```

- Makefile

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
  
  In the example:
  
  - `myprogram` is the target executable, `main.o` and `utility.o` are the object file dependencies, and `clean` is a target for removing built artifacts.
  
  - Open a terminal or command prompt, navigate to the project's root directory, and run the following command:
  
    ```shell
    make
    ```
  
    Make will read the makefile, analyze the dependencies, and execute the necessary commands to build the project.
  
  - To remove the generated files run the following command:
  
    ```shell
    make clean
    ```

    This target will remove the built artifacts, such as the object files.

### 1.2. CMake

[CMake](https://cmake.org/) is a cross-platform build system generator. It generates build files (e.g., Makefiles or project files) for different build systems, such as Make, Ninja, or Visual Studio. CMake provides a high-level scripting language that allows developers to define the build process and handle platform-specific differences.

Example of CMake:

- Structure

  ```txt
  MyProject/
  ├── CMakeLists.txt
  ├── src/
  │   ├── main.cpp
  │   └── utility.cpp
  └── include/
      └── (header files, if any)
  ```

- CMakeLists.txt

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

  In the example:

  - Set the minimum required CMake version to 3.21 using `cmake_minimum_required(VERSION 3.21)`. Then, we specify the project name using `project(MyProject)`.

  - Set the C++ standard to C++11 with `set(CMAKE_CXX_STANDARD 11)`.

  - Define a list of source files (`src/main.cpp` and `src/utility.cpp`) in the `SOURCES` variable.

  - Add an executable target named `MyExecutable` that will be built from the specified source files using `add_executable(MyExecutable ${SOURCES})`.

  - Set the include directories using `target_include_directories(MyExecutable PRIVATE include)` to include the `include` directory for the target `MyExecutable`.

### 1.3. Gradle

[Gradle](https://gradle.org/) is a build system commonly used in Java and Android development. It offers a flexible and powerful build automation framework. Gradle uses a Groovy-based domain-specific language (DSL) to define the build scripts. It supports dependency management, task parallelization, and incremental builds.

Example of Gradle:

- Structure

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

  In the structure:

  - `build.gradle`: The Gradle build script file that defines the project configuration, dependencies, and tasks.
  - `src/`: The directory that contains the source code for the project.
    - `main/`: The directory for main source code.
      - `java/`: The directory for Java source files.
        - `com/`: The package structure for the project.
          - `example/`: The package for the project's classes.
            - `MyApplication.java`: The main Java class file for the project.
    - `test/`: The directory for test source code.
      - `java/`: The directory for Java test source files.
        - `com/`: The package structure for the test code.
          - `example/`: The package for the project's test classes.
            - `MyApplicationTest.java`: The Java test class file for the project.

- build.gradle

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

  In the example, written in Groovy:

  - `plugins` block: This block specifies the plugins to be applied to the project. In this case, we apply the `java` plugin, which adds support for Java compilation, testing, and packaging.

  - `group` and `version`: These properties define the project's group and version, which are used for identifying the project artifacts.

  - `repositories` block: This block configures the repositories where Gradle looks for dependencies. In this example, we use `mavenCentral()` as the repository for fetching dependencies.

  - `dependencies` block: This block defines the project's dependencies. In this example, we include `com.google.guava:guava:30.1-jre` as an implementation dependency, and `junit:junit:4.13.2` as a test implementation dependency.

  - `tasks.test` block: This block configures the test task. In this example, we use JUnit for testing by calling `useJUnit()`.

  - `task runApplication` block: This block defines a custom task named `runApplication`. It uses the `JavaExec` type to execute a Java class. We specify the main class name as `com.example.MyApplication` and set the classpath to the runtime classpath of the `main` source set.

### 1.4. Maven

[Maven](https://maven.apache.org/) is a build automation and dependency management tool primarily used for Java projects. It emphasizes convention over configuration and follows the Project Object Model (POM) approach. Maven manages project dependencies, builds the project using predefined lifecycle phases, and provides plugins for various tasks.

Example of Maven:

- Structure

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

  In the structure:

  - `src/`: The directory that contains the source code for the project.
    - `main/`: The directory for main source code.
      - `java/`: The directory for Java source files.
        - `com/`: The package structure for the project.
          - `example/`: The package for the project's classes.
            - `MyApp.java`: The main Java class file for the project.
    - `test/`: The directory for test source code.
      - `java/`: The directory for Java test source files.
        - `com/`: The package structure for the test code.
          - `example/`: The package for the project's test classes.
            - `MyAppTest.java`: The Java test class file for the project.
  - `pom.xml`: The Project Object Model (POM) file that contains project configuration and dependencies.

- pom.xml

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

  In the example:

  - `<groupId>`, `<artifactId>`, and `<version>`: These elements define the project's coordinates, specifying the group, artifact, and version identifiers.

  - `<properties>`: This section allows to define properties that can be referenced throughout the POM. In this example, we specify the source and target Java versions for compilation.

  - `<dependencies>`: This section defines the project's dependencies. In this example, we include the JUnit dependency with the specified version and scope.

### 1.5. Ant

[Ant (Another Neat Tool)](https://ant.apache.org/) is a Java-based build system that uses XML-based build scripts. It provides a flexible and customizable approach to building, testing, and deploying applications.

Example of Ant:

- Structure

  ```txt
  MyProject/
  ├── build.xml
  └── src/
      └── com/
          └── example/
              └── MyApp.java
  ```

  In the structure:

  - `build.xml`: The Ant build script file that contains the project configuration and build targets.
  - `src/`: The directory that contains the source code for the project.
    - `com/`: The package structure for the project.
      - `example/`: The package for the project's classes.
        - `MyApp.java`: The Java source file for the project.

- build.xml

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

  In the example:

  - `<project>`: The root element of the Ant build script. It defines the project name and specifies the default target.

  - `<property>`: This element defines properties that can be used throughout the build script. In this example, we define properties for the source directory (`src.dir`), build directory (`build.dir`), and distribution directory (`dist.dir`).

  - `<target>`: Targets represent specific build actions or tasks. They can have dependencies on other targets. In this example, we have three targets: `clean`, `compile`, and `jar`.

  - `clean`: The `clean` target deletes the build and distribution directories to ensure a clean build environment.

  - `compile`: The `compile` target creates the build directory, and then compiles the Java source files in the source directory (`src.dir`) and places the compiled classes in the build directory (`build.dir`).

  - `jar`: The `jar` target creates a JAR file using the compiled classes from the build directory. It creates the distribution directory if it doesn't exist, and the resulting JAR file is named `MyProject.jar` and placed in the distribution directory (`dist.dir`). The `<manifest>` element inside the `<jar>` task specifies the Main-Class attribute for the JAR file.

  - `build`: The `build` target is the default target, which means it will be executed when no specific target is specified. In this example, the `build` target depends on the `jar` target, so running `ant` without specifying a target will clean the build directories, compile the Java source files, and create the JAR file.

### 1.6. Bazel

[Bazel](https://bazel.build/) is an open-source build system developed by Google. It focuses on scalability and supports large-scale projects with multiple programming languages. Bazel uses a declarative language to define build targets and dependencies. It provides caching, parallel execution, and incremental builds.

Bazel allows to customize the build configuration based on the project's specific requirements. It allows to define additional build targets, specify compiler flags, include additional libraries. Bazel's flexibility and extensibility provide the ability to create complex build configurations for large-scale projects.

Example of Bazel:

- Structure

  ```txt
  MyProject/
  ├── WORKSPACE
  ├── BUILD
  └── src/
      ├── main.cc
      └── BUILD
  ```

  In the structure:

  - `WORKSPACE`: The Bazel workspace file that defines the project and its external dependencies.
  - `BUILD`: The project-level Bazel build file that specifies build targets and dependencies.
  - `src/`: The directory that contains the source code for the project.
    - `main.cc`: The C++ source file for the project.
    - `BUILD`: The package-level Bazel build file that specifies build targets and dependencies for the `src/` directory.

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

  In the example, we define a Bazel workspace named `"MyProject"` and declare an external dependency on Google Test (googletest). The `http_archive` rule is used to download and configure the external dependency.

- BUILD

  ```python
  cc_binary(
      name = "myapp",
      srcs = ["main.cc"],
      deps = ["@googletest//:gtest_main"],
  )
  ```

  In the project-level BUILD file, we define a C++ binary target named "myapp" using the `cc_binary` rule. The `srcs` attribute specifies the source files, and the `deps` attribute declares the dependency on the Google Test framework.

- src/BUILD

  ```python
  cc_library(
      name = "mylib",
      srcs = ["main.cc"],
      hdrs = ["main.h"],
      visibility = ["//src:__pkg__"],
  )
  ```

  In the package-level BUILD file, we define a C++ library target named "mylib" using the `cc_library` rule. The `srcs` attribute specifies the source files, the `hdrs` attribute specifies the header files, and the `visibility` attribute sets the visibility of the target within the package.

### 1.7. Ninja

Ninja is a fast and efficient build system designed for speed and simplicity. It focuses on minimizing build times and providing a streamlined build experience. Ninja is commonly used as a backend for other build systems, such as CMake and Meson, to perform the actual building process.

> NOTE Ninja build files are typically generated by higher-level build systems such as CMake or Meson.

Example of Ninja:

- Structure

  ```txt
  MyProject/
  ├── build.ninja
  └── src/
      └── main.cpp
  ```

  In the structure:

  - `build.ninja`: The Ninja build file that contains the build rules, targets, and commands for compiling and linking the project.
  - `src/`: The directory that contains the source code for the project.
    - `main.cpp`: The C++ source file for the project.

- build.ninja

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

  In this example:

  - Variables: The `CXX` variable specifies the C++ compiler command, and `CXXFLAGS` sets the compiler flags.

  - Build Rules: The `compile` rule defines how to compile source files. The `link` rule defines how to link object files into an executable. Each rule specifies the command to execute and a description for display during the build process.

  - Build Targets: The `build` command associates build rules with specific targets. Here, we compile `src/main.cpp` into `obj/main.o` using the `compile` rule, and then link `obj/main.o` into the final executable `bin/myapp` using the `link` rule.

  - Phony Target: The `clean` target is a phony target that is not associated with a file. It defines a command to clean the build artifacts by removing the `obj` and `bin` directories.

  - To use the Ninja build file, invoke the `ninja` command in the directory containing the `build.ninja` file. For example, running `ninja` would execute the build steps defined in the file, compiling the source file and linking the executable.
