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

    <!-- TODO -->

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

    <!-- TODO -->

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

    <!-- TODO -->

#### 1.2.2. Application

[Go Project Layout](https://github.com/golang-standards/project-layout) for applications. It is a set of common historical and emerging project layout patterns in the Go.

> [!NOTE]
> It's not an official standard defined by the core Go dev team.

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    <!-- TODO -->

2. Files and Folders

    <!-- TODO -->

### 1.3. Python

[Python Project Layout](https://github.com/johnthagen/python-blueprint) using best practices.

#### 1.3.1. Module

<!-- TODO -->

1. Layout and Structure

    <!-- TODO -->

    > [!NOTE]
    > Replace `<...>` brackets with the module-specific information.

2. Files and Folders

    <!-- TODO -->

#### 1.3.2. Application

<!-- TODO -->

1. Layout and Structure

    > [!NOTE]
    > Replace `<...>` brackets with the application-specific information.

    <!-- TODO -->

2. Files and Folders

    <!-- TODO -->

    - `/module`

    - `/docs`
      > Package reference documentation.

    - `/tests`
      > Package unit tests, execution tests, integration tests.

    - `/bin`
      > Holds executable files.

    - `setup.py`
      > Package and distribution management.

    - `requirements.txt`
      > Package dependency and version management.

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
