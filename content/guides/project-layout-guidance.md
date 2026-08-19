# Project Layout Guidance

- [1. Category](#1-category)
  - [1.1. C/C++](#11-cc)
    - [1.1.1. Library](#111-library)
    - [1.1.2. Application](#112-application)
  - [1.2. Go](#12-go)
    - [1.2.1. Package](#121-package)
    - [1.2.2. Application](#122-application)
  - [1.3. Python](#13-python)
    - [1.3.1. Module](#131-module)
    - [1.3.2. Application](#132-application)
  - [1.4. Ansible](#14-ansible)
    - [1.4.1. Collection](#141-collection)
    - [1.4.2. Playbook](#142-playbook)
  - [1.5. Terraform](#15-terraform)
    - [1.5.1. Module](#151-module)
    - [1.5.2. Project](#152-project)
  - [1.6. Kubernetes](#16-kubernetes)
    - [1.6.1. Charts](#161-charts)
    - [1.6.2. Project](#162-project)
- [2. References](#2-references)

## 1. Category

### 1.1. C/C++

The [Pitchfork Layout (PFL)](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs) is a convention for arranging source, build, and resource files in a file system to support uniformity, comprehensibility, and partitioning.

#### 1.1.1. Library

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the library-specific information.

    ```markdown
    <library>/
    │
    . `Hierarchical Structure`
    │
    ├── include/
    │   └── <library>/
    │       └── file.h
    │
    ├── src/
    │   │
    │   . `Functional-based Structure`
    │   │
    │   ├── file.c
    │   ├── file_test.cc
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── external/
    │   ├── <third-party>/
    │   └── README.md
    │
    ├── tests/
    │   ├── performance/
    │   │   ├── benchmark_test.cc
    │   │   └── CMakeLists.txt
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── examples/
    │   ├── example.c
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── docs/
    │   ├── decisions/
    │   │   └── adr-<topic>.md
    │   └── README.md
    │
    ├── build/
    │   ├── debug/
    │   │   └── lib/
    │   │       └── libprojectd.a
    │   └── release/
    │       └── lib/
    │           └── libproject.a
    │
    ├── tools/
    │   ├── cmake/
    │   └── README.md
    │
    ├── scripts/
    │   ├── shell/
    │   ├── python/
    │   ├── bootstrap
    │   ├── setup
    │   ├── teardown
    │   └── README.md
    │
    ├── CMakeLists.txt
    ├── CMakePresets.json
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `include/<library>/`
      > Public header files for the library, organized under the library name to avoid name collisions when installed system-wide.

    - `src/`
      > Implementation files and in-tree unit tests. Follows a `Functional-based Structure` to group related implementation and test files together.

      - `file.c`
        > Source implementation file.

      - `file_test.cc`
        > In-tree unit test file paired with the source file.

      - `CMakeLists.txt`
        > CMake build definition for the source directory.

    - `external/`
      > Third-party dependencies vendored into the project.

    - `tests/`
      > Additional tests that are not co-located with the source, such as performance benchmarks.

      - `performance/`
        > Benchmark tests measuring library performance.

    - `examples/`
      > Standalone example programs demonstrating library usage.

    - `docs/`
      > Project documentation and Architecture Decision Records (ADRs).

    - `build/`
      > Build output artifacts, separated into `debug/` and `release/` sub-directories.

    - `tools/`
      > Supporting development tools such as CMake helper scripts.

    - `scripts/`
      > Shell and Python scripts for bootstrapping, setup, and teardown of the development environment.

    - `CMakeLists.txt`
      > Root CMake build definition for the library.

    - `CMakePresets.json`
      > CMake presets for configuring common build configurations.

    - `LICENSE`
      > License file for the library.

    - `README.md`
      > Project overview and usage instructions.

#### 1.1.2. Application

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    ```markdown
    /<project>
    │
    . `Hierarchical Structure`
    │
    ├── internal/
    │   │
    │   . `Layered Structure`
    │   │
    │   ├── presentation/
    │   │   └── README.md
    │   │
    │   ├── application/
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── domain/
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── infrastructure/
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── external/
    │   └── README.md
    │
    ├── tests/
    │   ├── performance/
    │   │   ├── benchmark_test.cc
    │   │   └── CMakeLists.txt
    │   ├── integration/
    │   │   ├── top_down_test.cc
    │   │   └── CMakeLists.txt
    │   ├── e2e/
    │   │   ├── scenario_test.cc
    │   │   └── CMakeLists.txt
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── examples/
    │   ├── example.c
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── docs/
    │   ├── decisions/
    │   │   └── NNN-adr-<topic>.md
    │   ├── api.md
    │   └── README.md
    │
    ├── build/
    │   ├── bin/
    │   │   └── project.exe
    │   ├── lib/
    │   │   └── project.a
    │   └── cmake/
    │
    ├── tools/
    │   ├── cmake/
    │   └── README.md
    │
    ├── scripts/
    │   ├── shell/
    │   ├── python/
    │   ├── bootstrap
    │   ├── setup
    │   ├── teardown
    │   └── README.md
    │
    ├── assets/
    │   ├── dataset.csv
    │   └── README.md
    │
    ├── CMakeLists.txt
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `internal/`
      > Private application code organized using a `Layered Structure`. Code placed here cannot be imported by external packages.

      - `presentation/`
        > Presentation layer handling user interface and API endpoints.

      - `application/`
        > Application layer orchestrating use cases and business workflows.

      - `domain/`
        > Domain layer containing business logic, entities, and domain services.

      - `infrastructure/`
        > Infrastructure layer for persistence, messaging, and external service integrations.

    - `external/`
      > Third-party dependencies and vendored libraries.

    - `tests/`
      > Tests that are not co-located with the source, including performance benchmarks, integration tests, and end-to-end tests.

      - `performance/`
        > Benchmark tests for measuring application performance.

      - `integration/`
        > Integration tests exercising multiple components together.

      - `e2e/`
        > End-to-end tests validating full application scenarios.

    - `examples/`
      > Standalone example programs demonstrating application usage.

    - `docs/`
      > Project documentation and Architecture Decision Records (ADRs).

    - `build/`
      > Build output artifacts, including binaries and libraries.

    - `tools/`
      > Supporting development tools such as CMake helper scripts.

    - `scripts/`
      > Shell and Python scripts for bootstrapping, setup, and teardown of the development environment.

    - `assets/`
      > Data files such as datasets, fixtures, and static assets.

    - `CMakeLists.txt`
      > Root CMake build definition for the application.

    - `LICENSE`
      > License file for the application.

    - `README.md`
      > Project overview and usage instructions.

### 1.2. Go

#### 1.2.1. Package

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the package-specific information.

    ```markdown
    <package>/
    │
    . `Hierarchical Structure`
    │
    ├── cmd/
    │   └── app/
    │       └── main.go
    │
    ├── internal/
    │   └── pkg/
    │       ├── helper.go
    │       └── helper_test.go
    │
    ├── pkg/
    │   └── <package>/
    │       ├── <package>.go
    │       └── <package>_test.go
    │
    ├── go.mod
    ├── go.sum
    │
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `cmd/`
      > Main applications for the project. Each sub-directory represents a single executable (e.g., `cmd/app/`).

    - `internal/`
      > Private application and library code that cannot be imported by external packages.

    - `pkg/`
      > Library code intended to be used by external applications.

    - `go.mod`
      > Module definition file specifying the module path and dependency requirements.

    - `go.sum`
      > Checksums for the module's dependencies, ensuring reproducible builds.

    - `LICENSE`
      > License file for the package.

    - `README.md`
      > Project overview and usage instructions.

#### 1.2.2. Application

[Go Project Layout](https://github.com/golang-standards/project-layout) for applications. It is a set of common historical and emerging project layout patterns in the Go.

> [!NOTE]
> It's not an official standard defined by the core Go dev team.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    ```markdown
    <project>/
    │
    . `Hierarchical Structure`
    │
    ├── cmd/
    │   └── <project>/
    │       └── main.go
    │
    ├── internal/
    │   ├── <package-a>/
    │   │   ├── <package-a>.go
    │   │   └── <package-a>_test.go
    │   └── <package-b>/
    │       ├── <package-b>.go
    │       └── <package-b>_test.go
    │
    ├── pkg/
    │   └── <package>/
    │       ├── <package>.go
    │       └── <package>_test.go
    │
    ├── api/
    │   └── <api>.proto
    │
    ├── configs/
    │   └── <config>.yaml
    │
    ├── scripts/
    │   ├── bootstrap
    │   ├── setup
    │   └── teardown
    │
    ├── build/
    │   ├── ci/
    │   └── package/
    │
    ├── deployments/
    │   └── <deployment>.yaml
    │
    ├── test/
    │   ├── integration/
    │   └── e2e/
    │
    ├── docs/
    │   ├── decisions/
    │   │   └── NNN-adr-<topic>.md
    │   └── README.md
    │
    ├── tools/
    │
    ├── examples/
    │   └── <example>/
    │       └── main.go
    │
    ├── go.mod
    ├── go.sum
    ├── Makefile
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `cmd/`
      > Main applications for the project. Each sub-directory name matches the executable to build.

    - `internal/`
      > Private application and library code. This is the primary location for business logic that should not be exposed externally.

    - `pkg/`
      > Library code intended for use by external applications. Other projects can import these packages.

    - `api/`
      > OpenAPI/Swagger specs, JSON schema files, and protocol definition files.

    - `configs/`
      > Configuration file templates or default configurations.

    - `scripts/`
      > Scripts for building, installing, and performing various operations.

    - `build/`
      > Packaging and Continuous Integration configurations and scripts.

    - `deployments/`
      > IaaS, PaaS, system, and container orchestration deployment configurations.

    - `test/`
      > Additional external test apps and test data that do not belong alongside source files.

    - `docs/`
      > Design and user documentation, including Architecture Decision Records (ADRs).

    - `tools/`
      > Supporting tools for this project.

    - `examples/`
      > Examples for the application or public libraries.

    - `go.mod`
      > Module definition file specifying the module path and dependency requirements.

    - `go.sum`
      > Checksums for the module's dependencies, ensuring reproducible builds.

    - `Makefile`
      > Build automation and task runner for common development operations.

    - `LICENSE`
      > License file for the application.

    - `README.md`
      > Project overview and usage instructions.

### 1.3. Python

[Python Project Layout](https://github.com/johnthagen/python-blueprint) using best practices.

#### 1.3.1. Module

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the module-specific information.

    ```markdown
    <module>/
    │
    . `Hierarchical Structure`
    │
    ├── src/
    │   └── <module>/
    │       ├── __init__.py
    │       └── <module>.py
    │
    ├── tests/
    │   ├── __init__.py
    │   └── test_<module>.py
    │
    ├── docs/
    │   └── README.md
    │
    ├── pyproject.toml
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `src/<module>/`
      > Source code for the module, placed under `src/` to prevent accidental imports from the project root during development.

      - `__init__.py`
        > Marks the directory as a Python package and defines the public API of the module.

      - `<module>.py`
        > Module implementation file.

    - `tests/`
      > Unit and integration tests for the module.

    - `docs/`
      > Module documentation.

    - `pyproject.toml`
      > Project metadata, build configuration, and tool settings (replaces `setup.py` and `setup.cfg`).

    - `LICENSE`
      > License file for the module.

    - `README.md`
      > Module overview and usage instructions.

#### 1.3.2. Application

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    ```markdown
    <project>/
    │
    . `Hierarchical Structure`
    │
    ├── src/
    │   └── <project>/
    │       ├── __init__.py
    │       ├── main.py
    │       └── <module>/
    │           ├── __init__.py
    │           └── <module>.py
    │
    ├── tests/
    │   ├── __init__.py
    │   ├── unit/
    │   │   └── test_<module>.py
    │   └── integration/
    │       └── test_<module>.py
    │
    ├── docs/
    │   └── README.md
    │
    ├── scripts/
    │   ├── bootstrap
    │   ├── setup
    │   └── teardown
    │
    ├── pyproject.toml
    ├── requirements.txt
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `src/<project>/`
      > Application source code, placed under `src/` to prevent accidental imports from the project root.

      - `__init__.py`
        > Marks the directory as a Python package.

      - `main.py`
        > Application entry point.

      - `<module>/`
        > Sub-module containing related functionality.

    - `tests/`
      > Unit tests, integration tests, and execution tests for the application.

    - `docs/`
      > Application documentation.

    - `scripts/`
      > Shell scripts for bootstrapping, setup, and teardown of the development environment.

    - `pyproject.toml`
      > Project metadata, build configuration, and tool settings.

    - `requirements.txt`
      > Package dependency and version management for pinned runtime dependencies.

    - `LICENSE`
      > License file for the application.

    - `README.md`
      > Project overview and usage instructions.

### 1.4. Ansible

#### 1.4.1. Collection

An Ansible Collection packages and distributes roles, modules and plugins. Organizing Ansible Collection content under a [directory structure](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections_structure.html), it is crucial to follow a specific layout to ensure that Ansible can recognize and properly utilize the collection.

1. Layout and Structure

    The project path is based on the `collections/ansible_collections` keywords and the Fully Qualified Collection Name (FQCN) `<namespace>.<collection>`, in accordance with the [naming convention](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections_creating.html#naming-your-collection).

    > [!NOTE]
    > None of the directories are required.

    > [!NOTE]
    > Replace `<...>` brackets with the project-specific information.

    ```markdown
    <project>-ansible-collection/
    └── collections/
        └── ansible_collections/
            └── <namespace>/
                └── <collection>/
                    │
                    ├── meta/
                    │   └── runtime.yml
                    │
                    ├── plugins/
                    │   ├── action/
                    │   ├── become/
                    │   ├── cache/
                    │   ├── callback/
                    │   ├── cliconf/
                    │   ├── connection/
                    │   ├── filter/
                    │   ├── httpapi/
                    │   ├── inventory/
                    │   ├── lookup/
                    │   ├── module_utils/
                    │   ├── modules/
                    │   │   ├── __init__.py
                    │   │   └── <module>.py
                    │   ├── netconf/
                    │   ├── shell/
                    │   ├── strategy/
                    │   ├── terminal/
                    │   ├── test/
                    │   └── vars/
                    │
                    ├── roles/
                    │   ├── <role-a>/
                    │   │   ├── defaults/
                    │   │   │   └── main.yml
                    │   │   ├── files/
                    │   │   │   └── LICENSE
                    │   │   ├── handlers/
                    │   │   │   └── main.yml
                    │   │   ├── tasks/
                    │   │   │   └── main.yml
                    │   │   ├── templates/
                    │   │   │   ├── config.yml.j2
                    │   │   │   └── docker-compose.yml.j2
                    │   │   ├── vars/
                    │   │   │   └── main.yml
                    │   │   └── README.md
                    │   └── <role-b>/
                    │       ├── defaults/
                    │       │   └── main.yml
                    │       ├── handlers/
                    │       │   └── main.yml
                    │       ├── tasks/
                    │       │   └── main.yml
                    │       └── README.md
                    │
                    ├── playbooks/
                    │   ├── files/
                    │   ├── vars/
                    │   ├── templates/
                    │   └── tasks/
                    │
                    ├── galaxy.yml
                    └── README.md
    ```

2. Files and Folders

    - `galaxy.yml`
      > The source of the [metadata](https://docs.ansible.com/ansible/latest/dev_guide/collections_galaxy_meta.html#collections-galaxy-meta) file used to generate a collection on Galaxy and to build a collection artifact.

    - `meta/`
      > Collection metadata directory.

      - `runtime.yml`
        > Declares the minimum required Ansible version and plugin routing for the collection.

    - `plugins/`
      > The collections plugins directory ships various plugins inside an Ansible collection. Each plugin is placed in a folder named after its type. It also includes `module_utils` and `modules` directories for module utilities and modules respectively.

      - `modules/`
        > Custom Ansible modules. At least one module is `required` for most collections.

        - `__init__.py`
          > A `required` empty file to initialize the namespace and allow Python to import the files.

      - `inventory/`
        > Custom inventory plugins. At least one plugin is `required` for inventory collections.

    - `roles/`
      > Ansible roles bundled with the collection, each following the standard role directory structure.

    - `playbooks/`
      > Playbooks distributed as part of the collection.

    - `docs/`
      > Describes the use of the roles, plugins, and role requirements provided by the collection.

    - `README.md`
      > Collection overview and usage instructions.

#### 1.4.2. Playbook

Ansible Playbook [directory layout](https://docs.ansible.com/ansible/latest/tips_tricks/sample_setup.html#alternative-directory-layout) organizes tasks in roles, with a inventory file for each environment and a playbooks.

> [!TIP]
> The layout promotes separation of concerns and enables scalable management across multiple environments.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the project-specific information.

    ```markdown
    <project>-ansible-playbook/
    │
    . `Modular Structure`
    │
    ├── collections/
    │   └── ansible_collections/
    │       └── <namespace>/
    │           ├── <collection-a>/
    │           │   ├── meta/
    │           │   │   └── runtime.yml
    │           │   ├── roles/
    │           │   │   ├── <role-a>/
    │           │   │   └── <role-b>/
    │           │   ├── tests/
    │           │   ├── docs/
    │           │   ├── galaxy.yml
    │           │   └── README.md
    │           │
    │           └── <collection-b>/
    │               ├── meta/
    │               │   └── runtime.yml
    │               ├── roles/
    │               │   ├── <role-a>/
    │               │   └── <role-b>/
    │               ├── tests/
    │               ├── docs/
    │               ├── galaxy.yml
    │               └── README.md
    │
    . `Hierarchical Structure`
    │
    ├── playbooks/
    │   ├── <playbook-a>.yml
    │   └── <playbook-b>.yml
    │
    ├── inventory/
    │   ├── dev/
    │   │   ├── group_vars/
    │   │   │   ├── all/
    │   │   │   │   ├── all.yml
    │   │   │   │   └── vault.yml
    │   │   │   ├── <group-a>.yml
    │   │   │   └── <group-b>.yml
    │   │   ├── host_vars/
    │   │   │   ├── <host-a.localhost>.yml
    │   │   │   └── <host-b.localhost>.yml
    │   │   └── hosts.yml
    │   ├── stage/
    │   │   ├── group_vars/
    │   │   │   ├── all/
    │   │   │   │   ├── all.yml
    │   │   │   │   └── vault.yml
    │   │   │   ├── <group-a>.yml
    │   │   │   └── <group-b>.yml
    │   │   ├── host_vars/
    │   │   │   ├── <staging.host-a.com>.yml
    │   │   │   └── <staging.host-b.com>.yml
    │   │   └── hosts.yml
    │   └── prod/
    │       ├── group_vars/
    │       │   ├── all/
    │       │   │   ├── all.yml
    │       │   │   └── vault.yml
    │       │   ├── <group-a>.yml
    │       │   └── <group-b>.yml
    │       ├── host_vars/
    │       │   ├── <host-a.com>.yml
    │       │   └── <host-b.com>.yml
    │       └── hosts.yml
    │
    ├── site.yml
    ├── requirements.yml
    ├── ansible.cfg
    └── README.md
    ```

2. Files and Folders

    - `collections/`
      > Vendored Ansible collections installed locally, organized by namespace and collection name under `ansible_collections/`.

    - `playbooks/`
      > Ansible playbooks that define the automation workflows applied to the inventory.

    - `inventory/`
      > Host inventory files and variable definitions, organized per environment (`dev/`, `stage/`, `prod/`).

      - `group_vars/`
        > Variable files applied to host groups, including an `all/` sub-directory for variables shared across all hosts.

      - `host_vars/`
        > Variable files applied to specific hosts.

      - `hosts.yml`
        > Inventory file listing the hosts and their group memberships for the environment.

    - `site.yml`
      > Top-level playbook entry point that includes all other playbooks.

    - `requirements.yml`
      > Declares the Ansible collections and roles required by the project.

    - `ansible.cfg`
      > Ansible configuration file defining project-level settings.

    - `README.md`
      > Project overview and usage instructions.

### 1.5. Terraform

#### 1.5.1. Module

Terraform modules define self-contained, reusable resources of Infrastructure-as-Code (IaC). The Terraform [module structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure) for reusable modules distributed in separate repositories.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the module-specific information.

    ```markdown
    terraform-<provider>-<project>/
    ├── modules/
    │   ├── <module-a>/
    │   │   ├── main.tf
    │   │   ├── data.tf
    │   │   ├── locals.tf
    │   │   ├── outputs.tf
    │   │   ├── variables.tf
    │   │   ├── versions.tf
    │   │   └── README.md
    │   └── <module-b>/
    │       ├── main.tf
    │       ├── data.tf
    │       ├── locals.tf
    │       ├── outputs.tf
    │       ├── variables.tf
    │       ├── versions.tf
    │       └── README.md
    │
    ├── examples/
    │   ├── simple/
    │   │   ├── main.tf
    │   │   ├── variables.tf
    │   │   ├── outputs.tf
    │   │   ├── versions.tf
    │   │   └── README.md
    │   └── complete/
    │       ├── main.tf
    │       ├── variables.tf
    │       ├── outputs.tf
    │       ├── versions.tf
    │       └── README.md
    │
    ├── tests/
    │   ├── unit/
    │   │   ├── bucket_name.tftest.hcl
    │   │   ├── input_validation.tftest.hcl
    │   │   └── provider.tftest.hcl
    │   ├── integration/
    │   │   └── modules.tftest.hcl
    │   └── README.md
    │
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── versions.tf
    │
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `modules/`
      > Reusable Terraform sub-modules that can be composed to build the root module.

      - `<module>/`
        > An individual sub-module with its own set of Terraform files.

        - `main.tf`
          > Primary resource definitions for the module.

        - `data.tf`
          > Data source definitions for the module.

        - `locals.tf`
          > Local value definitions to simplify expressions within the module.

        - `outputs.tf`
          > Output value definitions exposed by the module.

        - `variables.tf`
          > Input variable declarations for the module.

        - `versions.tf`
          > Provider version constraints for the module.

    - `examples/`
      > Example configurations demonstrating how to use the module in simple and complete scenarios.

    - `tests/`
      > Terraform test files using the native HCL test framework.

      - `unit/`
        > Unit tests validating individual module inputs and resource naming.

      - `integration/`
        > Integration tests validating the composition of multiple modules.

    - `main.tf`
      > Root module entry point defining the primary resources.

    - `variables.tf`
      > Input variable declarations for the root module.

    - `outputs.tf`
      > Output value definitions exposed by the root module.

    - `versions.tf`
      > Provider and Terraform version constraints for the root module.

    - `LICENSE`
      > License file for the module.

    - `README.md`
      > Module overview, usage instructions, and input/output documentation.

#### 1.5.2. Project

A structured Terraform project for [multiple environments](https://developer.hashicorp.com/terraform/language/style#multiple-environments) designed to facilitate the management of Terraform configurations, reusable modules, and environment-specific settings.

> [!TIP]
> The layout promotes separation of concerns and enables scalable management across multiple environments.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the project-specific information.

    ```markdown
    terraform-<project>/
    │
    . `Modular Structure`
    │
    ├── modules/
    │   ├── <module-a>/
    │   └── <module-b>/
    │
    . `Hierarchical Structure`
    │
    ├── environments/
    │   ├── dev/
    │   ├── stage/
    │   │   ├── <stack-a>/
    │   │   │   ├── main.tf
    │   │   │   ├── backend.tf
    │   │   │   ├── provider.tf
    │   │   │   ├── locals.tf
    │   │   │   ├── variables.tf
    │   │   │   ├── outputs.tf
    │   │   │   ├── data.tf
    │   │   │   └── versions.tf
    │   │   └── <stack-b>/
    │   └── prod/
    │       ├── <stack-a>/
    │       │   ├── main.tf
    │       │   ├── backend.tf
    │       │   ├── provider.tf
    │       │   ├── locals.tf
    │       │   ├── variables.tf
    │       │   ├── outputs.tf
    │       │   ├── data.tf
    │       │   └── versions.tf
    │       └── <stack-b>/
    │
    ├── tests/
    │
    └── README.md

    ```

2. Files and Folders

    - `modules/`
      > Local reusable Terraform modules shared across environments.

    - `environments/`
      > Environment-specific Terraform configurations, each environment containing one or more stacks.

      - `<env>/<stack>/`
        > A single deployable stack within the environment.

        - `main.tf`
          > Primary resource definitions and module calls for the stack.

        - `backend.tf`
          > Remote state backend configuration for the stack.

        - `provider.tf`
          > Provider configurations for the stack.

        - `locals.tf`
          > Local value definitions to simplify expressions within the stack.

        - `variables.tf`
          > Input variable declarations for the stack.

        - `outputs.tf`
          > Output value definitions exposed by the stack.

        - `data.tf`
          > Data source definitions for the stack.

        - `versions.tf`
          > Provider and Terraform version constraints for the stack.

    - `tests/`
      > Terraform test files validating project configurations.

    - `README.md`
      > Project overview and usage instructions.

3. Examples and Explanations

    - Initialize workspace
      > Initialize the Terraform working directory for a specific environment and stack.

      ```make
      ## Initialize Terraform workspace
      terraform-init:
        terraform -chdir=environments/$(ENV)/$(STACK) init
      .PHONY: terraform-init
      ```

    - Plan changes
      > Generate and review an execution plan for a specific environment and stack.

      ```make
      ## Plan Terraform changes
      terraform-plan:
        terraform -chdir=environments/$(ENV)/$(STACK) plan
      .PHONY: terraform-plan
      ```

    - Apply changes
      > Apply the Terraform execution plan for a specific environment and stack.

      ```make
      ## Apply Terraform changes
      terraform-apply:
        terraform -chdir=environments/$(ENV)/$(STACK) apply
      .PHONY: terraform-apply
      ```

### 1.6. Kubernetes

Kubernetes configuration represents declarative desired state, so repositories are commonly organized by deployment responsibility and composition. Helm defines the internal structure of charts, Kustomize defines reusable bases and overlays, and GitOps repositories commonly separate application workloads, platform capabilities, reusable components, and cluster entry points.

#### 1.6.1. Charts

A Helm [Charts](https://helm.sh/docs/topics/charts/) is a package of files that describes a related set of Kubernetes resources. Helm defines the [Chart File Structure](https://helm.sh/docs/topics/charts/#the-chart-file-structure) and reserves specific file and directory names within a chart.

> [!NOTE]
> Helm reserves use of the `charts/`, `crds/`, and `templates/` directories, and of the listed file names.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the chart-specific information.

    ```markdown
    <chart>/
    ├── Chart.yaml
    ├── values.yaml
    ├── values.schema.json
    │
    ├── crds/
    │
    ├── charts/
    │
    ├── templates/
    │   ├── _helpers.tpl
    │   ├── deployment.yaml
    │   ├── hpa.yaml
    │   ├── ingress.yaml
    │   ├── service.yaml
    │   ├── serviceaccount.yaml
    │   └── NOTES.txt
    │
    ├── .helmignore
    │
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    > [!NOTE]
    > The template files follow the standard conventions for writing [Go templates](https://pkg.go.dev/text/template).

    - `Chart.yaml`
      > Required chart metadata, including the chart name, version, and API version.

    - `values.yaml`
      > Default configuration values consumed by chart templates.

    - `values.schema.json`
      > OPTIONAL JSON Schema for validating and documenting the structure of chart values.

    - `charts/`
      > Chart dependencies packaged or downloaded as subcharts. This directory is part of the Helm chart format and should not be confused with a project-level directory for third-party charts.

    - `crds/`
      > CustomResourceDefinition (CRD) manifests installed before the chart's templated resources.

    - `templates/`
      > Templates that Helm renders with values to produce Kubernetes manifests.

      - `_helpers.tpl`
        > Reusable named template definitions, commonly used for labels, selectors, and resource names.

      - `deployment.yaml`
        > Template for a Kubernetes `Deployment` resource managing application pod replicas.

      - `hpa.yaml`
        > Template for a Kubernetes `HorizontalPodAutoscaler` resource enabling automatic scaling based on metrics.

      - `ingress.yaml`
        > Template for a Kubernetes `Ingress` resource exposing HTTP and HTTPS routes to services.

      - `service.yaml`
        > Template for a Kubernetes `Service` resource providing stable network access to pods.

      - `serviceaccount.yaml`
        > Template for a Kubernetes `ServiceAccount` resource used by workloads requiring a Kubernetes identity.

      - `NOTES.txt`
        > OPTIONAL plain text file containing usage notes displayed after chart installation.

    - `.helmignore`
      > Patterns identifying files that should be excluded when packaging the chart.

    - `LICENSE`
      > OPTIONAL chart license information.

    - `README.md`
      > OPTIONAL chart documentation and usage instructions.

3. Examples and Explanations

    - Create Local Chart
      > Create the skeleton for a Helm chart.

      ```make
      ## Create a new Helm chart
      helm-create-chart:
        helm create <chart>
      .PHONY: helm-create-chart
      ```

    - Pull Published Chart
      > Pull an exact published chart version from a trusted Helm repository or OCI registry rather than copying third-party chart source into the project by default.

      ```make
      ## Pull a published Helm chart
      helm-pull-chart:
        helm pull <repository>/<chart> --version <version>
      .PHONY: helm-pull-chart
      ```

      > [!NOTE]
      > Vendor third-party charts only when hermetic or offline rendering is an explicit project requirement.

    - Render Chart
      > Render a chart locally to validate templates and the resulting Kubernetes manifests.

      ```make
      ## Render a Helm chart
      helm-render-chart:
        helm template <release> ./<chart> \
          --namespace=default \
          --values=./<chart>/values.yaml \
          --output-dir=./render
      .PHONY: helm-render-chart
      ```

#### 1.6.2. Project

The declarative management of [Kubernetes objects using Kustomize](https://kubectl.docs.kubernetes.io/references/kustomize/glossary/#kustomization-root) involves organizing resources into reusable and composable configurations.

> [!TIP]
> Flux recommendations for [repository-structure](https://fluxcd.io/flux/guides/repository-structure/) for organising Kustomize resources to align with the project’s deployment model and operational requirements.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the project-specific information.

    ```markdown
    k8s-<project>/
    │
    . `Modular Structure`
    │
    ├── charts/
    │   ├── <charts-a>/
    │   └── <charts-b>/
    │
    . `Responsibility-based Structure`
    │
    ├── apps/
    │   ├── <app-a>/
    │   │   ├── base/
    │   │   │   ├── kustomization.yaml
    │   │   │   └── namespace.yaml
    │   │   └── overlays/
    │   │       ├── dev/
    │   │       │   ├── kustomization.yaml
    │   │       │   ├── values.yaml
    │   │       │   └── patch.yaml
    │   │       ├── stage/
    │   │       │   └── kustomization.yaml
    │   │       └── prod/
    │   │           └── kustomization.yaml
    │   └── <app-b>/
    │       ├── base/
    │       │   └── kustomization.yaml
    │       └── overlays/
    │           ├── dev/
    │           ├── stage/
    │           └── prod/
    │
    ├── platform/
    │   ├── controllers/
    │   │   ├── <controller-a>/
    │   │   │   ├── base/
    │   │   │   │   └── kustomization.yaml
    │   │   │   └── overlays/
    │   │   │       ├── dev/
    │   │   │       ├── stage/
    │   │   │       └── prod/
    │   │   └── <controller-b>/
    │   │
    │   ├── services/
    │   │   ├── <service-a>/
    │   │   │   ├── base/
    │   │   │   │   └── kustomization.yaml
    │   │   │   └── overlays/
    │   │   │       ├── dev/
    │   │   │       ├── stage/
    │   │   │       └── prod/
    │   │   └── <service-b>/
    │   │
    │   ├── configs/
    │   │   ├── <capability-a>/
    │   │   │   ├── base/
    │   │   │   │   └── kustomization.yaml
    │   │   │   └── overlays/
    │   │   │       ├── dev/
    │   │   │       ├── stage/
    │   │   │       └── prod/
    │   │   └── <capability-b>/
    │   │
    │   └── README.md
    │
    ├── components/
    │   └── <component>/
    │       └── kustomization.yaml
    │
    ├── clusters/
    │   ├── dev/
    │   │   └── kustomization.yaml
    │   ├── stage/
    │   │   └── kustomization.yaml
    │   └── prod/
    │       └── kustomization.yaml
    │
    ├── docs/
    │   └── decisions/
    │       └── adr-<topic>.md
    │
    └── README.md
    ```

2. Files and Folders

    - `apps/`
      > Application workload deployment contracts. Each application owns its reusable Kubernetes configuration and environment or cluster specializations.

      - `<app>/base/`
        > Stable Kustomize resources shared by the application's overlays. A base contains a `kustomization.yaml` and should not depend on a specific overlay.

      - `<app>/overlays/<env>/`
        > Environment-specific composition and customization. Overlays reference the base and contain only the differences required for that target, such as Kustomize patches or Helm values.

        - `kustomization.yaml`
          > Kustomize configuration composing the base and declaring target-specific generators, patches, image changes, or Helm chart configuration.

        - `values.yaml`
          > OPTIONAL Helm values used when the overlay renders a Helm chart through Kustomize.

        - `patch.yaml`
          > OPTIONAL Kustomize patch containing Kubernetes-level changes that should not be expressed as Helm values.

    - `platform/`
      > Shared cluster capabilities whose lifecycle is independent of any single application. Organize platform resources by responsibility rather than by environment or by an undifferentiated list of services.

      - `controllers/`
        > Controllers, operators, admission components, networking controllers, and other software that extends or operates the Kubernetes cluster. Examples include Traefik, cert-manager, External Secrets Operator, and database operators.

        - `<controller>/base/`
          > Stable installation resources for the controller.

        - `<controller>/overlays/<env>/`
          > Target-specific controller configuration such as Helm values, patches, or feature differences.

      - `services/`
        > Shared runtime capabilities consumed by multiple workloads and managed as part of the platform. Examples include observability, logging, shared databases, shared caches, or artifact services.

        - `<service>/base/`
          > Stable resources for the shared service.

        - `<service>/overlays/<env>/`
          > Target-specific service configuration and deployment differences.

      - `configs/`
        > Shared Kubernetes configuration consumed by platform controllers or services, kept separate from installation of the capability itself. Examples include certificate issuers, ingress or gateway policy, shared SecretStores, and controller-specific custom resources.

        - `<capability>/base/`
          > Stable shared configuration for the capability.

        - `<capability>/overlays/<env>/`
          > OPTIONAL target-specific configuration when the shared capability requires environment or cluster specialization.

      - `README.md`
        > Platform ownership rules and guidance for classifying new controllers, services, and configuration.

    - `components/`
      > OPTIONAL reusable Kustomize components or cross-cutting configuration shared by multiple applications or platform capabilities. Components should represent composable behavior rather than complete deployable environments.

    - `clusters/`
      > Canonical deployable desired-state entry points. Each cluster directory contains a `kustomization.yaml` that composes the selected application and platform overlays for that cluster.

      - `<cluster>/kustomization.yaml`
        > Top-level Kustomize composition for a single cluster target. Environment names such as `dev`, `stage`, and `prod` are suitable for simple topologies; multi-cluster installations should use identifiers that distinguish concrete cluster targets, for example `prod-eu-central-1-01`.

    - `docs/`
      > Project documentation and Architecture Decision Records (ADRs) describing deployment and platform decisions.

    - `README.md`
      > Project overview, deployment model, prerequisites, and operating instructions.

3. Examples and Explanations

    ```make
    K8S_CLUSTER ?= dev
    K8S_CLUSTER_PATH ?= clusters/$(K8S_CLUSTER)
    K8S_RENDER_FILE ?= render/kustomize/$(K8S_CLUSTER).yaml

    ## Render the complete desired state for a cluster
    k8s-render:
      mkdir -p "$(dir $(K8S_RENDER_FILE))"
      kustomize build "$(K8S_CLUSTER_PATH)" --enable-helm > "$(K8S_RENDER_FILE)"
    .PHONY: k8s-render

    ## Deploy the complete desired state for a cluster
    k8s-deploy:
      kustomize build "$(K8S_CLUSTER_PATH)" --enable-helm \
        | kubectl apply -f -
    .PHONY: k8s-deploy

    ## Destroy the complete desired state for a cluster
    k8s-destroy:
      kustomize build "$(K8S_CLUSTER_PATH)" --enable-helm \
        | kubectl delete -f -
    .PHONY: k8s-destroy
    ```

## 2. References

- Sentenz [Project Layout](../articles/project-layout.md) article.
