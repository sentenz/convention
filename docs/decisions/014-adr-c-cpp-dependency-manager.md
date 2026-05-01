# 014-ADR: C/C++ Dependency Manager

Architectural Decision Records (ADR) on selecting a dependency manager for C/C++ projects.

- [1. State](#1-state)
- [2. Context](#2-context)
- [3. Decision](#3-decision)
  - [3.1. Conan](#31-conan)
- [4. Considered](#4-considered)
  - [4.1. Conan](#41-conan)
  - [4.2. vcpkg](#42-vcpkg)
  - [4.3. CPM.cmake](#43-cpmcmake)
- [5. Consequences](#5-consequences)
- [6. Implementation](#6-implementation)
- [7. References](#7-references)

## 1. State

- Author(s): Sentenz
- Date: 2026-05-01
- Status: Proposed

## 2. Context

C and C++ projects lack a standardized package manager in the language ecosystem. Managing third-party and internal libraries across multiple platforms, compiler toolchains, and build configurations introduces significant complexity. Dependencies must be resolved consistently, build artifacts must be reproducible, and the toolchain must integrate cleanly with the CMake build system used within the project.

1. Decision Drivers

    - Dependencies and Dev Dependencies
      > The manager must allow separate declaration of runtime (production) and development-only dependencies (e.g., test frameworks, benchmarking libraries) to keep the production artifact lean.

    - Dependency Resolution
      > The manager must automatically resolve, download, and configure direct and transitive dependencies, including conflict detection and version negotiation.

    - Dependency Pinning
      > The manager must support explicit version pinning for all dependencies to eliminate non-deterministic resolution across environments.

    - Transitive Dependencies
      > The manager must automatically resolve and propagate transitive dependencies, making the full dependency graph visible and manageable.

    - Private and Public Dependencies
      > The manager must support public registries and private or self-hosted package repositories so that proprietary or internal packages can be managed alongside open-source dependencies.

    - Immutable Lockfiles
      > The manager must generate a machine-readable lockfile that captures the exact resolved dependency graph to guarantee identical builds across environments.

    - Prebuilt Binary and Source Build
      > The manager must support consuming prebuilt binaries (e.g., central registry) while allowing source builds when custom build options are required.

    - CMake Integration
      > The manager must generate CMake-compatible artifacts (e.g., `find_package`) to integrate seamlessly with the existing CMake build system without requiring manual path configuration.

    - Cross-Platform Support
      > The manager must operate across the operating systems (Linux, macOS, Windows), compiler toolchains (GCC, Clang, MSVC), and target platforms used for C and C++ development.

    - CI/CD
      > The manager must fit automated bootstrap, configure, build, test, and documentation jobs with minimal environment-specific branching.

## 3. Decision

### 3.1. Conan

Conan is selected as the C/C++ dependency manager. It separates regular from development dependencies, generates native CMake integration files, produces an immutable lockfile, and supports prebuilt binaries with a fallback to source builds. Its support for private Conan servers (Artifactory, self-hosted) and multi-platform cross-compilation profiles makes it suitable for enterprise projects.

1. Rationale

    - Dependencies and Dev Dependencies
      > Conan distinguishes production dependencies (`[requires]`) from tool/build-time dependencies (`[tool_requires]`), enabling a clean separation between runtime and development artifacts.

    - Dependency Resolution
      > Conan's SAT-solver-based resolver handles complex version graphs, detects conflicts, and supports version ranges and revisions.

    - Dependency Pinning
      > Exact versions are declared in `conanfile.txt` or `conanfile.py`, and the resolved package revisions are pinned in `conan.lock`, making dependency updates explicit and reviewable.

    - Transitive Dependencies
      > Conan resolves and manages the full dependency graph, propagating include paths, link flags, and compiler settings of transitive dependencies.

    - Private and Public Dependencies
      > Conan supports multiple configurable remotes (ConanCenter for public packages, JFrog Artifactory or a self-hosted Conan server for private packages) with per-remote authentication.

    - Immutable Lockfiles
      > The committed `conan.lock` can be treated as an immutable CI input until a deliberate lockfile refresh is reviewed and merged.

    - Prebuilt Binary and Source Build
      > Conan supports binary packages from remotes and can still build dependencies from source when the required binary is unavailable.

    - CMake Integration
      > The `CMakeDeps` and `CMakeToolchain` generators produce CMake config files and a toolchain file, allowing standard `find_package()` / `target_link_libraries()` usage with no manual path setup.

    - Cross-Platform Support
      > Conan profile files abstract compiler, OS, architecture, and standard library settings, enabling the same `conanfile.txt` to target Linux, macOS, Windows, and cross-compilation scenarios without modification.

    - CI/CD
      > Conan operates fully headlessly, its binary cache is file-system-based and integrates with any CI cache layer (GitHub Actions, GitLab CI, Jenkins). The `--lockfile` flag enforces the recorded graph in pipelines.

## 4. Considered

### 4.1. Conan

[Conan](https://conan.io/) is a decentralized, cross-platform C/C++ package manager focused on reproducible builds and binary distribution.

```ini
# conanfile.txt
[requires]
zlib/1.3.1
boost/1.84.0

[tool_requires]
gtest/1.14.0

[generators]
CMakeDeps
CMakeToolchain
```

- Pros

  - Dependencies and Dev Dependencies
    > Supports `[requires]` for runtime dependencies and `[tool_requires]` for build-time and dev-only tools, cleanly separating production from development artifacts.

  - Dependency Resolution
    > Uses a SAT-solver-based graph resolver that handles version ranges, revisions, conflicts, and complex transitive graphs reliably.

  - Dependency Pinning
    > Version pinning is native; `conanfile.txt` / `conanfile.py` declare exact versions, and `conan.lock` records every resolved revision.

  - Transitive Dependencies
    > Propagates all settings, options, and link flags through the full dependency graph automatically.

  - Immutable Lockfiles
    > `conan.lock` captures the full resolved graph including package revisions, enabling deterministic and reproducible builds.

  - Cross-Platform Support
    > Profile system abstracts OS, compiler, architecture, and standard library, enabling multi-platform and cross-compilation workflows from the same recipe.

  - Prebuilt Binary and Source Build
    > Transparently downloads prebuilt binaries from a remote or builds from source when no matching binary exists, without requiring recipe changes.

  - CMake Integration
    > `CMakeDeps` and `CMakeToolchain` generators produce config files and toolchain files consumed directly by `find_package()` and `cmake --toolchain`.

  - Private and Public Dependencies
    > Supports multiple remotes with per-remote authentication; works with ConanCenter (public), JFrog Artifactory, and self-hosted Conan servers.

- Cons

  - Setup Complexity
    > Requires installing Python and configuring profiles, remotes, and settings before first use, adding initial onboarding friction compared to header-only solutions.

  - Ecosystem Size
    > ConanCenter is smaller than vcpkg's curated port catalogue. Packages not available on ConanCenter require custom recipe authoring in Python (`conanfile.py`).

### 4.2. vcpkg

[vcpkg](https://vcpkg.io/) is a Microsoft-maintained C/C++ package manager with Visual Studio and CMake integration.

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "dependencies": [
    "zlib",
    "boost-filesystem"
  ]
}
```

- Pros

  - Dependency Resolution
    > Resolves and installs transitive dependencies automatically from a large curated port catalogue (over 2,000 ports).

  - CMake Integration
    > Toolchain file (`vcpkg.cmake`) enables transparent `find_package()` integration; CMake Presets can reference vcpkg's toolchain directly.

  - Cross-Platform Support
    > Supports Linux, macOS, and Windows through a triplet system to express target platform, architecture, and linkage type.

  - Prebuilt Binary and Source Build
    > vcpkg's central registry provides prebuilt binaries for ports. Source builds for custom options or platforms are supported.

  - Private and Public Dependencies
    > Supports private registries and overlay ports, allowing internal packages to be managed alongside public ones.

- Cons

  - Dependencies and Dev Dependencies
    > No distinction between runtime and development-only dependencies within the manifest file.

  - Immutable Lockfiles
    > vcpkg generates a `vcpkg.json` manifest and optional `vcpkg-configuration.json` baseline, but does not produce a full lockfile capturing every resolved transitive dependency revision.

  - Dependency Pinning
    > Version pinning requires `overrides` entries in `vcpkg.json` and a baseline. The mechanism is less ergonomic than Conan's exact pinning with revisions.

### 4.3. CPM.cmake

[CPM.cmake](https://github.com/cpm-cmake/CPM.cmake) is a CMake dependency manager built on the CMake `FetchContent` module.

```cmake
# CMakeLists.txt
include(cmake/CPM.cmake)

CPMAddPackage("gh:fmtlib/fmt#9.1.0")
CPMAddPackage("gh:google/googletest@1.14.0")
```

- Pros

  - CMake Integration
    > Packages are declared directly in `CMakeLists.txt` using `CPMAddPackage()`, requiring no external tooling beyond CMake itself.

  - Zero Installation
    > CPM.cmake is a single CMake script; no additional tools need to be installed in the development environment.

  - Simplicity
    > Minimal configuration overhead for small projects with few dependencies.

  - Cross-Platform Support
    > Inherits full CMake cross-platform support.

  - Immutable Lockfiles
    > CPM.cmake can generate a `package-lock.cmake` file that captures the exact resolved URLs and commit hashes of dependencies, enabling reproducible builds.

- Cons

  - Prebuilt Binary and Source Build
    > CPM.cmake always builds dependencies from source; there is no prebuilt binary registry or binary caching mechanism, leading to significantly longer build times.

  - Dependencies and Dev Dependencies
    > No formal separation between runtime and development dependencies; all packages are treated uniformly.

  - Transitive Dependencies
    > Transitive dependency resolution is limited to `CMakeLists.txt` package declarations; conflicts must be resolved manually.

## 5. Consequences

1. Positive

    - Reproducibility
      > Conan provides fully reproducible builds via `conan.lock`, enabling the exact same dependency graph to be reproduced from a single `conanfile.txt` and lockfile across all developer machines and CI environments.

    - Binary Caching
      > Conan's binary cache reduces CI build times by reusing prebuilt packages rather than rebuilding dependencies from source on every pipeline run.

    - CMake Integration
      > Native integration with the CMake build system through `CMakeDeps` and `CMakeToolchain` eliminates manual path configuration and aligns with existing build conventions.

2. Negative

    - Setup Overhead
      > Developers must install Python and the Conan client and must create and maintain a Conan profile for each platform or toolchain target, increasing initial onboarding effort.

    - Custom Recipes
      > Any new dependency not present on ConanCenter requires authoring a custom Conan recipe in Python (`conanfile.py`), which involves learning the domain-specific language (DSL).

3. Risks

    - Package Availability
      > If a required package is not available on ConanCenter and a custom recipe cannot be maintained, an alternative source strategy (vendoring, system package) must be adopted. Mitigation: audit all required dependencies against ConanCenter before adoption and prefer widely used libraries with existing recipes.

## 6. Implementation

1. Install the Conan client (`pip install conan`) and initialize a default profile (`conan profile detect`) on all developer machines and CI runners.

2. Define a `conanfile.txt` at the repository root declaring `[requires]` for runtime dependencies and `[tool_requires]` for development dependencies, with `CMakeDeps` and `CMakeToolchain` listed under `[generators]`.

3. Run `conan install . --lockfile-out=conan.lock` to resolve the dependency graph and generate an immutable lockfile; commit `conan.lock` to version control.

4. Integrate the Conan-generated toolchain file into `CMakePresets.json` via the `CMAKE_TOOLCHAIN_FILE` cache variable so that all CMake presets automatically consume Conan-managed dependencies.

5. Validate integration by confirming that `cmake --preset <preset>` resolves all `find_package()` calls without errors and that CI builds reproduce identically using the committed lockfile.

## 7. References

- Conan [Center Package Index](https://conan.io/center) site.
- Conan [Official Documentation](https://docs.conan.io/2/) site.
- Conan [conanfile.txt](https://docs.conan.io/2/reference/conanfile_txt.html) reference.
- Conan [Lockfiles](https://docs.conan.io/2/tutorial/versioning/lockfiles.html) reference.
- Conan [CMakeDeps Generator](https://docs.conan.io/2/reference/tools/cmake/cmakedeps.html) reference.
- Conan [CMakeToolchain Generator](https://docs.conan.io/2/reference/tools/cmake/cmaketoolchain.html) reference.
- vcpkg [Documentation](https://vcpkg.io/en/docs/README.html) site.
- vcpkg [Manifest Mode](https://learn.microsoft.com/en-us/vcpkg/reference/vcpkg-json) page.
- GitHub [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake) repository.
