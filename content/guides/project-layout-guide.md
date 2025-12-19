# Project Layout Guide

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

    - `inc/`
      > Public header files for the library. Uses a subdirectory with the library name to avoid naming conflicts when installed system-wide.

    - `src/`
      > Source implementation files (`.c`/`.cpp`), unit tests (`_test.cc`), CMake build configuration, and module-specific documentation.

    - `external/`
      > Third-party dependencies and external libraries used by the project.

    - `test/`
      > Higher-level tests such as performance benchmarks and integration tests, separate from unit tests in `src/`.

    - `examples/`
      > Example programs demonstrating library usage, with their own build configuration.

    - `docs/`
      > Project documentation including Architecture Decision Records (ADRs) and developer guides.

    - `build/`
      > Build output directory containing compiled artifacts (libraries, executables) organized by build type (debug/release).

    - `tools/`
      > Build tools and utilities, such as CMake modules and helper scripts.

    - `scripts/`
      > Automation scripts for bootstrapping, setup, and teardown operations.

    - `CMakeLists.txt`
      > Root CMake build configuration file.

    - `CMakePresets.json`
      > CMake presets for common build configurations.

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Project overview, build instructions, and usage documentation.

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

    - `internal/`
      > Private application code organized in a layered architecture structure (presentation, application, domain, infrastructure).

    - `internal/presentation/`
      > User interface and presentation layer components.

    - `internal/application/`
      > Application services and use cases that orchestrate domain logic.

    - `internal/domain/`
      > Core business logic, entities, and domain models.

    - `internal/infrastructure/`
      > External integrations, database access, and infrastructure concerns.

    - `external/`
      > Third-party dependencies and external libraries.

    - `test/`
      > Contains performance benchmarks, integration tests, and end-to-end tests.

    - `examples/`
      > Example programs demonstrating application usage.

    - `docs/`
      > Project documentation including Architecture Decision Records (ADRs) and API documentation.

    - `build/`
      > Build output directory containing binaries, libraries, and CMake artifacts.

    - `tools/`
      > Build tools and utilities, such as CMake modules.

    - `scripts/`
      > Automation scripts for bootstrapping, setup, and teardown operations.

    - `data/`
      > Application data files such as datasets, configurations, or test data.

    - `CMakeLists.txt`
      > Root CMake build configuration file.

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Project overview, architecture documentation, and usage instructions.

### 1.2. Go

#### 1.2.1. Package

Go packages organize and reuse code in Go programming language. The [Standard Go Project Layout](https://github.com/golang-standards/project-layout) for packages is a convention that promotes consistency and maintainability across Go projects.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the package-specific information.

    ```markdown
    <package>/
    │
    . `Hierarchical Structure`
    │

    ├── internal/
    │  ├── auth/
    │  ├── transport/
    │  └── ...
    │
    ├── pkg/
    │   └── <package>/
    │       ├── <filename>.go
    │       ├── <filename>_test.go
    │       └── ...
    │
    ├── go.mod
    ├── go.sum
    │
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `internal/`
      > Private application and library code that cannot be imported by external projects.

    - `pkg/`
      > Public library code that can be used by external applications, organized by package name.

    - `go.mod`
      > Go module definition file declaring the module path and dependencies.

    - `go.sum`
      > Go module checksums for dependency verification.

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Package documentation, installation instructions, and usage examples.

#### 1.2.2. Application

[Go Project Layout](https://github.com/golang-standards/project-layout) for applications. It is a set of common historical and emerging project layout patterns in the Go.

> [!NOTE]
> It's not an official standard defined by the core Go dev team.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    ```markdown
    <application>/
    │
    . `Hierarchical Structure`
    │
    ├── cmd/
    │   └── <app>/
    │       └── main.go
    │
    ├── internal/
    │   ├── app/
    │   ├── config/
    │   └── ...
    │
    ├── pkg/
    │   └── <package>/
    │
    ├── api/
    │   ├── openapi/
    │   └── proto/
    │
    ├── web/
    │   ├── static/
    │   └── templates/
    │
    ├── configs/
    │   └── config.yaml
    │
    ├── scripts/
    │
    ├── deployments/
    │   ├── docker/
    │   └── k8s/
    │
    ├── test/
    │
    ├── docs/
    │
    ├── go.mod
    ├── go.sum
    ├── Makefile
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `cmd/`
      > Main applications for the project. The directory name for each application should match the name of the executable.

    - `internal/`
      > Private application and library code that cannot be imported by external projects.

    - `pkg/`
      > Library code that can be used by external applications.

    - `api/`
      > API definition files (OpenAPI/Swagger specs, Protocol Buffers, JSON schema).

    - `web/`
      > Web application specific components: static assets, server-side templates.

    - `configs/`
      > Configuration file templates or default configs.

    - `scripts/`
      > Scripts for various build, install, analysis operations.

    - `deployments/`
      > IaaS, PaaS, system and container orchestration deployment configurations and templates.

    - `test/`
      > Additional external test apps and test data.

    - `docs/`
      > Design and user documents.

    - `go.mod`
      > Go module definition file.

    - `go.sum`
      > Go module checksums.

    - `Makefile`
      > Build and task automation.

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Project overview and documentation.

### 1.3. Python

[Python Project Layout](https://github.com/johnthagen/python-blueprint) using best practices.

#### 1.3.1. Module

A Python module is a reusable package that can be installed and imported by other Python projects.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the module-specific information.

    ```markdown
    <module>/
    │
    ├── src/
    │   └── <module>/
    │       ├── __init__.py
    │       ├── <module>.py
    │       └── py.typed
    │
    ├── tests/
    │   ├── __init__.py
    │   ├── test_<module>.py
    │   └── conftest.py
    │
    ├── docs/
    │   ├── conf.py
    │   ├── index.rst
    │   └── api.rst
    │
    ├── pyproject.toml
    ├── setup.py
    ├── requirements.txt
    ├── requirements-dev.txt
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `src/`
      > Source code directory following the src-layout pattern to avoid import issues.

    - `src/<module>/`
      > The actual module package containing the implementation code.

    - `__init__.py`
      > Package initialization file that makes the directory a Python package.

    - `py.typed`
      > Marker file indicating the package supports type checking (PEP 561).

    - `tests/`
      > Test suite for the module including unit tests and integration tests.

    - `conftest.py`
      > Pytest configuration and shared fixtures.

    - `docs/`
      > Documentation source files, typically using Sphinx.

    - `pyproject.toml`
      > Python project configuration file (PEP 518) defining build system and dependencies.

    - `setup.py`
      > Package distribution setup script (being replaced by pyproject.toml).

    - `requirements.txt`
      > Runtime dependencies.

    - `requirements-dev.txt`
      > Development dependencies (testing, linting, documentation tools).

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Module documentation, installation, and usage instructions.

#### 1.3.2. Application

A Python application is a standalone program or service designed to be deployed and run.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    ```markdown
    <application>/
    │
    ├── src/
    │   └── <application>/
    │       ├── __init__.py
    │       ├── __main__.py
    │       ├── cli.py
    │       ├── core/
    │       ├── models/
    │       └── utils/
    │
    ├── tests/
    │   ├── unit/
    │   ├── integration/
    │   └── conftest.py
    │
    ├── docs/
    │   └── README.md
    │
    ├── scripts/
    │   ├── bootstrap.sh
    │   └── deploy.sh
    │
    ├── config/
    │   ├── development.yaml
    │   ├── production.yaml
    │   └── config.yaml
    │
    ├── data/
    │
    ├── bin/
    │
    ├── pyproject.toml
    ├── setup.py
    ├── requirements.txt
    ├── LICENSE
    └── README.md
    ```

2. Files and Folders

    - `src/<application>/`
      > Main application package containing all source code.

    - `__main__.py`
      > Entry point for running the application as a module (`python -m <application>`).

    - `cli.py`
      > Command-line interface implementation.

    - `core/`
      > Core business logic and application functionality.

    - `models/`
      > Data models and domain entities.

    - `utils/`
      > Utility functions and helper modules.

    - `tests/`
      > Test suite organized by test type (unit, integration, e2e).

    - `docs/`
      > Package reference documentation.

    - `scripts/`
      > Automation scripts for deployment, bootstrapping, and maintenance.

    - `config/`
      > Configuration files for different environments.

    - `data/`
      > Application data, datasets, or static files.

    - `bin/`
      > Holds executable files.

    - `pyproject.toml`
      > Python project configuration and dependencies.

    - `setup.py`
      > Package and distribution management.

    - `requirements.txt`
      > Package dependency and version management.

    - `LICENSE`
      > Project license file.

    - `README.md`
      > Application documentation, setup instructions, and usage guide.

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

    <!-- TODO -->

    - `galaxy.yml`
      > The source of the [metadata](https://docs.ansible.com/ansible/latest/dev_guide/collections_galaxy_meta.html#collections-galaxy-meta) file used to generate a collection on Galaxy and to build a collection artifact.

    - Modules

    - `/meta`
    >

    - `runtime.yml`
      >

    - `plugins/`
      > The Collections plugins directory can be used to ship various plugins inside an Ansible collection. Each plugin is placed in a folder that is named after the type of plugin it is in. It can also include the `module_utils` and `modules` directory that would contain module utils and modules respectively.

    - `/modules`
      > At least one plugin `required`.

    - `__init__.py`
      > A `required` empty file to initialize namespace and allow Python to import the files.

    - `/inventory`
      > At least one plugin `required`.

    - Roles
    - Playbooks

    - `/docs`
      > Describes the use of the roles, plugins and role requirements provided by the collection.

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

    <!-- TODO -->

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

    <!-- TODO -->

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
    │   │   ├── <component-a>/
    │   │   │   ├── main.tf
    │   │   │   ├── backend.tf
    │   │   │   ├── provider.tf
    │   │   │   ├── locals.tf
    │   │   │   ├── variables.tf
    │   │   │   ├── outputs.tf
    │   │   │   ├── data.tf
    │   │   │   └── versions.tf
    │   │   └── <component-b>/
    │   └── prod/
    │       ├── <component-a>/
    │       │   ├── main.tf
    │       │   ├── backend.tf
    │       │   ├── provider.tf
    │       │   ├── locals.tf
    │       │   ├── variables.tf
    │       │   ├── outputs.tf
    │       │   ├── data.tf
    │       │   └── versions.tf
    │       └── <component-b>/
    │
    ├── tests/
    │
    └── README.md

    ```

2. Files and Folders

    <!-- TODO -->

3. Examples and Explanations

    <!-- TODO -->

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
        > TODO

      - `deployment.yaml`
        > TODO

      - `hpa.yaml`
        > TODO

      - `ingress.yaml`
        > TODO

      - `service.yaml`
        > TODO

      - `serviceaccount.yaml`
        > TODO

      - `NOTES.txt`
        > A OPTIONAL plain text file containing short usage notes.

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

    <!-- TODO -->

3. Examples and Explanations

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
