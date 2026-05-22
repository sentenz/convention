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
    ├── inc/
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
    ├── test/
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
    ├── /tools
    │   ├── /cmake
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

    - `inc/<library>/`
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

    - `test/`
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
    ├── /internal
    │   │
    │   . `Layered Structure`
    │   │
    │   ├── /presentation
    │   │   └── README.md
    │   │
    │   ├── /application
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── /domain
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── /infrastructure
    │   │   ├── CMakeLists.txt
    │   │   └── README.md
    │   │
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── /external
    │   └── README.md
    │
    ├── /test
    │   ├── /performance
    │   │   ├── benchmark_test.cc
    │   │   └── CMakeLists.txt
    │   ├── /integration
    │   │   ├── top_down_test.cc
    │   │   └── CMakeLists.txt
    │   ├── /e2e
    │   │   ├── scenario_test.cc
    │   │   └── CMakeLists.txt
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── /examples
    │   ├── example.c
    │   ├── CMakeLists.txt
    │   └── README.md
    │
    ├── /docs
    │   ├── /adr
    │   │   ├── merging-strategy-adr.md
    │   │   └── branching-strategy-adr.md
    │   ├── api.md
    │   └── README.md
    │
    ├── /build
    │   ├── /bin
    │   │   └── project.exe
    │   ├── /lib
    │   │   └── project.a
    │   └── /cmake
    │
    ├── /tools
    │   ├── /cmake
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
    ├── /data
    │   ├── dataset.csv
    │   └── README.md
    │
    ├── CMakeLists.txt
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `/internal`
      > Private application code organized using a `Layered Structure`. Code placed here cannot be imported by external packages.

      - `/presentation`
        > Presentation layer handling user interface and API endpoints.

      - `/application`
        > Application layer orchestrating use cases and business workflows.

      - `/domain`
        > Domain layer containing business logic, entities, and domain services.

      - `/infrastructure`
        > Infrastructure layer for persistence, messaging, and external service integrations.

    - `/external`
      > Third-party dependencies and vendored libraries.

    - `/test`
      > Tests that are not co-located with the source, including performance benchmarks, integration tests, and end-to-end tests.

      - `/performance`
        > Benchmark tests for measuring application performance.

      - `/integration`
        > Integration tests exercising multiple components together.

      - `/e2e`
        > End-to-end tests validating full application scenarios.

    - `/examples`
      > Standalone example programs demonstrating application usage.

    - `/docs`
      > Project documentation and Architecture Decision Records (ADRs).

    - `/build`
      > Build output artifacts, including binaries and libraries.

    - `/tools`
      > Supporting development tools such as CMake helper scripts.

    - `scripts/`
      > Shell and Python scripts for bootstrapping, setup, and teardown of the development environment.

    - `/data`
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
    │   │   └── adr-<topic>.md
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

A structured Terraform project designed to facilitate the management of Terraform configurations, reusable modules, and environment-specific settings.

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

#### 1.6.1. Charts

Helm Charts as a packaging is a collection of to describe a related set of Kubernetes resources. The [Chart File Structure](https://helm.sh/docs/topics/charts/#the-chart-file-structure) of files inside of a directory.

> [!NOTE]
> Helm reserves use of the `charts/`, `crds/`, and `templates/` directories, and of the listed file names.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the charts-specific information.

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
      > A Helm chart defining the applications Kubernetes resources.

    - `values.yaml`
      > The default configuration values for this chart.

    - `values.schema.json`
      > A OPTIONAL JSON Schema for imposing a structure on the `values.yaml` file.

    - `charts/`
      > A directory containing any charts upon which this chart depends.

    - `crds/`
      > Kubernetes provides a mechanism for declaring new types of Kubernetes objects using CustomResourceDefinitions (CRDs).

    - `templates/`
      > A directory of templates that, when combined with values, will generate valid Kubernetes manifest files.

      - `_helpers.tpl`
        > A partial template file defining reusable named template blocks (e.g., labels, selectors) used across other templates.

      - `deployment.yaml`
        > Template for the Kubernetes `Deployment` resource managing application pod replicas.

      - `hpa.yaml`
        > Template for the Kubernetes `HorizontalPodAutoscaler` resource enabling automatic scaling based on metrics.

      - `ingress.yaml`
        > Template for the Kubernetes `Ingress` resource exposing HTTP and HTTPS routes to services.

      - `service.yaml`
        > Template for the Kubernetes `Service` resource providing stable network access to pods.

      - `serviceaccount.yaml`
        > Template for the Kubernetes `ServiceAccount` resource used to control pod permissions.

      - `NOTES.txt`
        > An OPTIONAL plain text file containing short usage notes displayed after chart installation.

3. Examples and Explanations

    - Local Chart
      > Create a new local helm chart.

      ```make
      ## Create a new helm chart
      helm-create-chart:
        helm create charts/<chart>
      .PHONY: helm-create-chart
      ```

    - Vendor Chart
      > Vendor a public chart into `charts/` and lock its version, e.g. pull app-a@1.4.2 into charts/app-a.

      ```make
      ## Vendor a public chart
      helm-vendor-chart:
        helm pull my-repo/app-a --version 1.4.2 --untar --untardir charts
      .PHONY: helm-vendor-chart
      ```

    - Render Chart
      > Render a chart into `render/` to validate e.g. Go templates.

      ```make
      ## Render template helm chart
      helm-render-chart:
        helm template <chart> charts/<chart> \
          --namespace=default \
          --values=charts/<chart>/values.yaml \
          --set image.tag=v1.0.0 \
          --output-dir=./rendered
      .PHONY: helm-render-chart
      ```

#### 1.6.2. Project

A structured Kubernetes project designed to facilitate the management of Kubernetes manifests, Helm charts, and environment-specific configurations using Kustomize.

> [!TIP]
> The layout promotes separation of concerns and enables scalable management across multiple environments.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the project-specific information.

    ```markdown
    k8s-<project>/
    │
    . `Modular Structure`
    │
    ├── charts/
    │   ├── <chart-a>/
    │   └── <chart-b>/
    │
    . `Hierarchical Structure`
    │
    ├── manifests/
    │   ├── base/
    │   │   ├── kustomization.yaml
    │   │   ├── namespace.yaml
    │   │   └── common-labels.yaml
    │   └── overlays/
    │       ├── dev/
    │       │   ├── kustomization.yaml
    │       │   └── patch.yaml
    │       ├── stage/
    │       │   ├── kustomization.yaml
    │       │   └── patch.yaml
    │       └── prod/
    │           ├── kustomization.yaml
    │           └── patch.yaml
    │
    └── README.md
    ```

2. Files and Folders

    - `charts/`
      > Helm charts for the applications deployed in the project, each following the Helm chart file structure.

    - `manifests/`
      > Kustomize-managed Kubernetes manifests organized into base and environment-specific overlays.

      - `base/`
        > Base Kubernetes manifests shared across all environments.

        - `kustomization.yaml`
          > Kustomize configuration listing all base resources to include.

        - `namespace.yaml`
          > Kubernetes `Namespace` manifest defining the target namespace.

        - `common-labels.yaml`
          > Common label definitions applied across all resources.

      - `overlays/`
        > Environment-specific Kustomize overlays that patch or extend the base manifests.

        - `<env>/kustomization.yaml`
          > Kustomize configuration for the environment, referencing the base and listing patches.

        - `<env>/patch.yaml`
          > Kustomize patch file applying environment-specific changes to base resources.

    - `README.md`
      > Project overview and usage instructions.

    ```make
    # Usage: make k8s-deploy-<env>
    #
    ## Deploys Kubernetes manifests integrating Helm charts for application templating and Kustomize for environment-specific overlays
    k8s-deploy-%:
      kustomize build manifests/overlays/$* \
        --enable-helm \
        --load-restrictor=LoadRestrictionsNone \
      | kubectl apply --kubeconfig examples/config/kubeconfig.yaml -f -
    .PHONY: k8s-deploy-%

    # Usage: make k8s-destroy-<env>
    #
    ## Destroys Kubernetes manifests integrating Helm charts for application templating and Kustomize for environment-specific overlays
    k8s-destroy-%:
      kustomize build manifests/overlays/$* \
        --enable-helm \
        --load-restrictor=LoadRestrictionsNone \
      | kubectl delete --kubeconfig examples/config/kubeconfig.yaml -f -
    .PHONY: k8s-destroy-%
    ```

## 2. References

- Sentenz [Project Layout](../articles/project-layout.md) article.
