# Tech Stack

A Tech Stack (Technology Stack) refers to the combination of languages, frameworks, tools, and infrastructure used to build, deploy, and run an application.

- [1. Category](#1-category)
  - [1.1. DevOps](#11-devops)
  - [1.2. Go](#12-go)
    - [1.2.1. Backend](#121-backend)
    - [1.2.2. API](#122-api)
    - [1.2.3. Frontend](#123-frontend)
    - [1.2.4. Database](#124-database)
    - [1.2.5. Hosting](#125-hosting)
  - [1.3. C/C++](#13-cc)
    - [1.3.1. Backend](#131-backend)
  - [1.4. Python](#14-python)
    - [1.4.1. Backend](#141-backend)
  - [1.5. Shell](#15-shell)
  - [1.6. PowerShell](#16-powershell)
  - [1.7. Containerization](#17-containerization)
  - [1.8. Orchestration](#18-orchestration)
  - [1.9. Infrastructure Management](#19-infrastructure-management)
  - [1.10. Configuration Management](#110-configuration-management)
  - [1.11. Documentation Management](#111-documentation-management)
  - [1.13. GitOps](#113-gitops)
  - [1.14. Cloud Computing](#114-cloud-computing)
    - [1.14.1. Hosting](#1141-hosting)
  - [1.15. Observability](#115-observability)
  - [1.16. Database](#116-database)
- [2. References](#2-references)

## 1. Category

### 1.1. DevOps

1. Container Manager

    - [x] [Docker](https://www.docker.com/)
      > Docker is an open-source platform for automating the deployment, scaling, and management of applications using containerization.

    - [ ] [Podman](https://podman.io/)
      > Podman is an open-source platform for automating the deployment, scaling, and management of applications using containerization without requiring a daemon.

2. Git Hooks Manager

    - [x] [pre-commit](https://pre-commit.com/)
      > A framework for managing and maintaining multi-language pre-commit hooks.

3. Dependency Update Manager

    - [x] [Dependabot](https://dependabot.com/)
      > Dependabot is a tool to automatically update dependencies by creating pull requests.

    - [x] [Renovate](https://www.mend.io/renovate/)
      > Renovate is a tool to automatically update dependencies by creating pull requests.

4. Release Manager

    - [x] [Semantic-Release](https://github.com/semantic-release/semantic-release)
      > Semantic-Release automates the release process by analyzing commit messages to release (major, minor, patch), generating release notes and changelogs.

5. Task Manager / Runner

    - [x] [Make](https://www.gnu.org/software/make/)
      > Make is a build automation tool that defines and manages tasks to streamline development workflows.

    - [ ] [Task](https://taskfile.dev/)
      > Task is a modern task runner that defines and manages tasks to streamline development workflows.

6. Policy / Compliance Manager

    - [x] [Conftest](https://www.conftest.dev/)
      > Conftest is a tool for writing tests against structured configuration data using the Open Policy Agent (OPA) Rego language.

    - [x] [Regal](https://github.com/open-policy-agent/regal)
      > Regal is a tool for writing tests against structured configuration data using the Open Policy Agent (OPA) Rego language, with a focus on testing Rego policies.

7. Supply Chain Manager

    - [x] [Trivy](https://github.com/aquasecurity/trivy)
      > Trivy is a comprehensive security scanner for vulnerabilities, misconfigurations, and compliance issues in container images, file systems, and Git repositories.

8. Context / Environment Manager

    - [x] [direnv](https://direnv.net/)
      > direnv is an environment switcher for the shell to automatically load and unload environment variables based on the current directory.

9. Secrets Manager

    - [x] [SOPS](https://github.com/getsops/sops)
      > SOPS (Secrets OPerationS) is an editor of encrypted files that supports YAML, JSON, ENV, and INI formats, to encrypt specific fields while keeping the overall structure of the file intact.

10. Key Manager

    - [x] [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
      > Vaultwarden is a self-hosted password manager compatible with Bitwarden clients, providing secure storage and management of passwords and sensitive information.

11. Documentation Generators

    - [x] [MkDocs](https://www.mkdocs.org/)
      > MkDocs is a Static Site Generator (SSG) designed for building project documentation using Markdown.

12. Version Control System (VCS)

    - [x] [Git](https://git-scm.com/)
      > Git is a distributed version control system used for tracking changes in source code during software development. It allows multiple developers to work on a project simultaneously without interfering with each others work. Git provides features such as branching, merging, and version history, which help manage and coordinate collaborative development efforts.

13. Platform

    - [x] [GitHub](https://github.com/)
      > GitHub is a web-based DevOps platform that provides version control and collaboration features for software development projects.

    - [x] [GitLab](https://gitlab.com/)
      > GitLab is a web-based DevOps platform that provides a complete set of tools for software development, including version control, issue tracking, continuous integration/continuous deployment (CI/CD), and project management.

14. Analysis

    - [X] SAST
      > SAST (Static Application Security Testing) is a method of analyzing source code or compiled code to identify security vulnerabilities and weaknesses without executing the program.

    - [X] DAST
      > DAST (Dynamic Application Security Testing) is a method of testing the security of an application while it is running.

    - [X] SCA
      > SCA (Software Composition Analysis) is a method of analyzing the components and dependencies of a software application to identify potential security vulnerabilities and license compliance.

15. Conventions & Style Guides

    - [x] [Zero Trust Architecture (ZTA)](https://csrc.nist.gov/publications/detail/sp/800-207/final)
      > A security framework that assumes no implicit trust; enforces continuous verification, least-privilege access, strong identity and device posture checks, and microsegmentation to minimize blast radius and reduce risk.

### 1.2. Go

#### 1.2.1. Backend

1. Programming & Scripting

    - [x] Go (Golang)
      > A statically typed, compiled language.

2. Dependency Manager

    - [x] [Go Modules](https://go.dev/ref/mod)
      > Go Modules are the official dependency management system for Go, allowing developers to manage versions and dependencies of their projects.

3. Test Frameworks

    - [x] [Testing](https://pkg.go.dev/testing)
      > Go builtin TDD-style testing framework for unit, fuzz, and bench tests.

    - [ ] [GoConvey](https://github.com/smartystreets/goconvey)
      > BDD-style testing framework.

4. Cache Manager

    - [x] [GroupCache](https://github.com/golang/groupcache)
      > GroupCache is a caching and cache-filling library, intended as a replacement for memcached.

5. Logging

    - [x] [Zap](https://github.com/uber-go/zap)
      > Fast, structured, leveled logging in Go.

    - [ ] [Logrus](https://github.com/sirupsen/logrus)
      > Structured, pluggable logging for Go.

    - [ ] [Zerolog](https://github.com/rs/zerolog)
      > Zero-allocation JSON logger.

6. Authentication

    - [x] [Goth](https://github.com/markbates/goth)
      > A package for handling OAuth and OAuth2 authentication.

7. Authorization

    - [x] [Casbin](https://github.com/casbin/casbin)
      > An authorization library that supports access control models like ACL, RBAC, ABAC.

8. Repository Strategy

    - [x] [Modular Monolith](../articles/repository-strategies.md#12-modular-monolith)
      > The Modular Monolith organizes a single application into distinct, self-contained modules within one repository.

9. Conventions & Style Guides

    - [x] [Google Go Style Guide](https://google.github.io/styleguide/go/)
      > The Go Style Guide and accompanying documents codify the current best approaches for writing readable and idiomatic Go.

#### 1.2.2. API

1. Web Frameworks

    - [x] [Chi](https://github.com/go-chi/chi)
      > A lightweight, idiomatic web framework for Go.

    - [ ] [Echo](https://github.com/labstack/echo)
      > A fast and minimalist web framework for routing HTTP requests.

    - [ ] [Gin](https://github.com/gin-gonic/gin)
      > Gin is a web framework.

    - [ ] [Fiber](https://github.com/gofiber/fiber)
      > Express inspired web framework built on top of Fasthttp.

2. Documentation Generators

    - [ ] Swagger
      > Swagger is a set of open-source tools built around the OpenAPI Specification that can help to design, build, document, and consume REST APIs.

#### 1.2.3. Frontend

1. Programming & Scripting

    - [ ] JavaScript
      > JavaScript is a programming language that conforms to the ECMAScript specification.

    - [ ] [TypeScript](https://github.com/microsoft/TypeScript)
      > TypeScript is a superset of JavaScript that compiles to plain JavaScript.

2. CSS Frameworks

    - [ ] [TailwindCSS](https://github.com/tailwindlabs/tailwindcss)
      > A utility-first CSS framework for rapidly building custom designs.

    - [ ] [Bootstrap](https://github.com/twbs/bootstrap)
      > HTML, CSS, and JavaScript framework for developing responsive, mobile projects on the web.

3. UI Frameworks

    - [ ] [React](https://github.com/facebook/react)
      > React is a JavaScript library for building user interfaces.

    - [ ] [Vue](https://github.com/vuejs/vue)
      > Vue is a progressive framework for building user interfaces.

4. UI Components

    - [ ] [DaisyUI](https://github.com/saadeghi/daisyui)
      > DaisyUI is a component library for Tailwind CSS.

5. State Manager

    - [ ] [Redux](https://github.com/reduxjs/redux)
      > Redux is a predictable state container for JavaScript apps.

    - [ ] [Vuex](https://github.com/vuejs/vuex)
      > Vuex is a state management pattern and library for Vue.js applications.

6. Packaging

    - [ ] [Webpack](https://github.com/webpack/webpack)
      > Webpack is a static module bundler for modern JavaScript applications.

    - [ ] [Vite](https://github.com/vitejs/vite)
      > Vite is a build tool that aims to provide a faster and leaner development experience for modern web projects.

7. Test Frameworks

    - [x] [Playwright](https://github.com/microsoft/playwright)
      > Playwright is a framework for Web Testing and Automation to testing Chromium, Firefox and WebKit with a single API.

    - [ ] [Jest](https://github.com/jestjs/jest)
      > Jest is a JavaScript Testing Framework.

#### 1.2.4. Database

1. Relational Drivers

    - [ ] [pq](https://github.com/lib/pq)
      > Pure Go Postgres driver for database/sql.

    - [ ] [pgx](https://github.com/jackc/pgx)
      > PostgreSQL driver and toolkit offering native bindings and database/sql compatibility.

    - [ ] [sqlx](https://github.com/jmoiron/sqlx)
      > Extensions to database/sql for Go with convenience helpers.

    - [x] [sqlc](https://github.com/sqlc-dev/sqlc)
      > A SQL Compiler to generate type-safe code from SQL.

    - [x] [GORM](https://github.com/go-gorm/gorm)
      > A ORM (Object Relational Mapping) library to work with relational databases.

2. Non-Relational Drivers

    - [ ] [mongo-go-driver](https://github.com/mongodb/mongo-go-driver)
      > Official MongoDB driver for Go.

3. In-Memory Drivers

    - [ ] [go-redis/redis](https://github.com/go-redis/redis)
      > Redis client for Go supporting Cluster, Sentinel, and generic commands.

#### 1.2.5. Hosting

1. Web Servers

    - [x] [Caddy](https://github.com/caddyserver/caddy)
      > Caddy is a powerful, extensible, enterprise-ready web server with automatic HTTPS.

    - [ ] [NGINX](https://www.nginx.com/)
      > NGINX is a high-performance web server that can also be used as a reverse proxy, load balancer, mail proxy, and HTTP cache.

2. Reverse Proxy

    - [x] [Traefik](https://github.com/traefik/traefik)
      > Traefik is a modern HTTP reverse proxy and load balancer for deploying microservices.

3. Certificate Manager

    - [x] [Let's Encrypt](https://letsencrypt.org/)
      > Let's Encrypt is a free, automated, and open certificate authority providing SSL/TLS certificates.

4. Container Registry

    - [ ] [Docker Hub](https://hub.docker.com/)
      > Public container registry for storing and distributing Docker images.

### 1.3. C/C++

#### 1.3.1. Backend

1. Programming & Scripting

    - [x] C
      > Standard C11/C17 is used for low-level programming and hardware interfacing.

    - [x] C++
      > Standard C++17 is utilized to leverage modern object-oriented and functional programming features while maintaining compatibility.

2. Build Systems

    - [x] [CMake](https://cmake.org)
      > Cross-platform build-system generator. Preferred for modern C/C++ projects; integrates with multiple toolchains and CI systems.

    - [x] [Ninja](https://ninja-build.org)
      > Lightweight, fast build backend used as CMake's primary generator for improved build performance.

    - [ ] [GNU Make](https://www.gnu.org/software/make/)
      > Traditional make-based build tool for Unix-like environments and simple projects.

3. Cache Manager

    - [x] [ccache](https://github.com/ccache/ccache)
      > A compiler cache to speeds up rebuilds by reusing previously compiled object files.

    - [ ] [sccache](https://github.com/mozilla/sccache)
      > A shared/remote compilation cache for distributed builds with Rust and C/C++ support.

4. Dependency Manager

    - [x] [Conan](https://github.com/conan-io/conan)
      > A decentralized, cross-platform C/C++ package manager for dependency resolution, binary distribution, and reproducible builds.

    - [ ] [Vcpkg](https://github.com/microsoft/vcpkg)
      > A cross-platform C/C++ library manager that simplifies acquiring, building, and integrating third‑party dependencies.

5. Compilers & Toolchains

    - [x] GNU Compiler Collection (GCC)
      > GCC is a compiler system supporting various programming languages for compiling C and C++ code on Unix-like systems.

    - [ ] Clang
      > Clang is an open-source compiler for the C family of programming languages, offering fast compilation and user-friendly error messages.

6. Analysis

    - [x] [SonarQube](https://www.sonarqube.org/)
      > A platform for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities.

    - [x] [Clang-Format](https://clang.llvm.org/docs/ClangFormat.html)
      > A tool to automatically format C/C++ code according to a set of rules and style guides.

    - [x] [Sanitizers](https://clang.llvm.org/docs/AddressSanitizer.html)
      > A suite of runtime tools to detect various types of bugs, including memory errors (AddressSanitizer), undefined behavior (UndefinedBehaviorSanitizer), and thread data races (ThreadSanitizer).

7. Test Framework

    - [x] [GoogleTest](https://google.github.io/googletest/)
      > GoogleTest (gtest/gmock) is a testing framework for C++, providing a rich set of features for unit testing and test-driven development.

      - [ ] [Google FuzzTest](https://github.com/google/fuzztest)
        > A library for coverage-guided fuzz testing of C++ code, integrated with GoogleTest. It is used to discover and exploit software vulnerabilities by generating random inputs.

      - [ ] [Google Benchmark](https://github.com/google/benchmark)
        > A microbenchmark support library for GoogleTest. It is used to add performance benchmarks to tests.

    - [x] [CTest](https://cmake.org/cmake/help/latest/manual/ctest.1.html#)
      > A testing tool integrated with CMake, primarily used for running tests and ensuring code quality across builds.

    - [ ] [Catch2](https://github.com/catchorg/Catch2)
      > A modern, C++-native, header-only test framework for unit-tests, TDD and BDD.

    - [x] [gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html)
      > A test coverage program used to analyze and create code coverage reports for C/C++ programs.

8. Documentation Generators

    - [x] [Doxygen](https://www.doxygen.nl/)
      > Doxygen is a open-source API documentation generator for various programming languages, including C++. It extracts structured comments from source code and generates documentation in multiple formats such as HTML, LaTeX, and XML.

9. Repository Strategy

    - [x] [Modular Monolith](../articles/repository-strategies.md#12-modular-monolith)
      > The Modular Monolith organizes a single application into distinct, self-contained modules within one repository.

10. Conventions & Style Guides

    - [x] [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
      > The Google C++ Style Guide is adopted as the primary coding style guide for consistency and readability.

    - [x] [Microsoft CMake Style Guide](https://learn.microsoft.com/en-us/vcpkg/contributing/cmake-guidelines)
      > Guidelines for writing clear, portable, and maintainable CMake scripts, including target-based patterns, recommended project layout, and best practices.

### 1.4. Python

#### 1.4.1. Backend

1. Programming & Scripting

    - [x] [Python](https://github.com/python)
      > Python is a high-level, interpreted programming language known for its readability and versatility. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming.

2. Dependency Manager

    - [x] [pip](https://pip.pypa.io/en/stable/)
      > pip is the package installer for Python to install packages from the Python Package Index and other indexes.

3. Analysis

    - [x] [Pylint](https://github.com/pylint-dev/pylint)
      > Pylint is a static code analyser for Python 2 or 3.

      > [!NOTE]
      > Run commands (rc) file [pylintrc](https://google.github.io/styleguide/pylintrc) for Google Python Style Guide.

    - [x] [Black](https://github.com/psf/black)
      > The uncompromising Python code formatter.

4. Test Frameworks

    - [x] [pytest](https://github.com/pytest-dev/pytest)
      > `pytest` is widely used for writing simple as well as scalable test cases in Python. It supports fixtures, parameterized testing, and has a rich plugin architecture, making it highly extensible. The framework is known for its ease of use and powerful features, which help developers ensure their code works as expected.

5. CLI

    > [!NOTE]
    > Concider the Order of Precedence for the configuration of variable parameters, from highest to lowest:
    > - Command-Line Flags
    > - Environment Variables (Env Vars)
    > - Dotenv Files (`.env`)
    > - Config Files (`.<cli>.yml`)
    > - Default Variables

    - [x] [ConfigArgParse](https://github.com/bw2/ConfigArgParse)
      > ConfigArgParse is a drop-in replacement for argparse that adds support for configuration files and environment variables with proper precedence order.

    - [ ] [Click](https://github.com/pallets/click)
      > Click is a Python package for creating command-line interfaces with support for configuration precedence.

    - [ ] [Typer](https://github.com/tiangolo/typer)
      > Typer is a library for building CLI applications based on Python type hints. It provides automatic help generation and supports configuration precedence through integration with Click.

    - [ ] [argparse](https://docs.python.org/3/library/argparse.html)
      > argparse is Pythons built-in command-line parsing library. Natively does not support configuration files, it can be extended with libraries like `configargparse` to support order of precedence.

6. Conventions & Style Guides

    - [x] [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
      > Guide for writing consistent and idiomatic Python programs.

    - [x] [Command Line Interface Guidelines](https://clig.dev/)
      > An open-source guide to write command-line programs, based on traditional UNIX principles with modern updates.

### 1.5. Shell

> [!NOTE]
> Prefer high-level interpreted languages e.g. **Python** over **Shell** scripts to benefit from readable syntax and mature tooling for testing, linting, formatting, and error reporting.

1. Programming & Scripting

    - [x] [Bash](https://www.gnu.org/software/bash/)
      > Bash (Bourne Again SHell) is a Unix shell and command language for writing scripts to automate tasks and workflows.

2. Analysis

    - [x] [ShellCheck](https://github.com/koalaman/shellcheck)
      > ShellCheck is a static analyzer for shell scripts. It finds syntax errors, common pitfalls, and suggests fixes.

    - [x] [shfmt](https://github.com/mvdan/sh#shfmt)
      > shfmt formats shell scripts consistently across dialects (Bash, Dash, Ksh).

3. Test Frameworks

    - [ ] [Bats](https://github.com/bats-core/bats-core)
      > Bats (Bash Automated Testing System) is a TDD-style framework for testing Bash scripts, providing tests, assertions, and reporting.

4. CLI

    - [x] [Argbash](https://github.com/matejak/argbash)
      > Argbash is not a parsing library, but it is rather a code generator that generates a bash library tailor-made for script.

5. Conventions & Style Guides

    - [x] [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
      > The guide defines best practices for writing readable, maintainable shell scripts, covering naming, indentation, commenting, and scripting patterns.

### 1.6. PowerShell

1. Programming & Scripting

    - [x] [PowerShell](https://github.com/PowerShell/PowerShell)
      > PowerShell is a cross-platform shell and scripting language for task automation and configuration management.

2. Module Manager

    - [x] [PowerShell Modules](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module)
      > PowerShell Modules are self-contained packages of functions, cmdlets, and resources that organize, distribute, and enable reuse of PowerShell code.

3. Registry

    - [x] [PowerShell Gallery](https://www.powershellgallery.com)
      > PowerShell Gallery is the central repository for publishing, discovering, and installing PowerShell modules and scripts.

4. Analysis

    - [x] [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)
      > PSScriptAnalyzer performs static code analysis to enforce best practices and identify script issues.

5. Test Frameworks

    - [ ] [Pester](https://github.com/pester/Pester)
      > Pester is a PowerShell testing framework, providing assertions, mocking, and test discovery for unit tests.

6. Conventions & Style Guides

    - [x] [PowerShell Advanced Functions](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced)
      > Advanced Functions enable cmdlet-like behavior with parameter validation or pipeline support.

    - [x] [PowerShell Verbs](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
      > Approved PowerShell Verbs standardize cmdlet and function naming for consistency.

    - [x] [OTBS (One True Brace Style)](../articles/indentation.md)
      > One True Brace Style (OTBS), a variant to **K&R**, defines indentation and brace placement compatible with PowerShell syntax.

    - [x] [PowerShell Documentation](https://learn.microsoft.com/en-us/powershell)
      > Microsoft PowerShell Documentation is the official reference for language features and cmdlets.

    - [x] [Cmdlet Development Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/cmdlet-development-guidelines)
      > Cmdlet Development Guidelines prescribe naming, parameter handling, and output best practices.

### 1.7. Containerization

1. Container Manager

    - [x] [Docker](https://www.docker.com/)
      > Docker is an open-source platform for automating the deployment, scaling, and management of applications using containerization.

2. Registry

    - [x] [Docker Hub](https://hub.docker.com/)
      > Docker Hub is a cloud-based registry service for building and shipping application or service containers. It provides a centralized resource for container image discovery, distribution and change management, user and team collaboration, and workflow automation throughout the development pipeline.

3. Analysis

    - [x] [hadolint](https://github.com/hadolint/hadolint)
      > A Dockerfile linter that helps to build best practice Docker images.

4. Conventions & Style Guides

    - [x] Hardened Container Images
      > Curated base images and guidelines hardened to reduce attack surface and minimize image size.

    - [x] [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
      > Docker provides a comprehensive guide on best practices for writing Dockerfiles.

### 1.8. Orchestration

1. Orchestration Manager

    - [x] [Kubernetes (kubectl, kustomiz)](https://github.com/kubernetes/kubernetes)
      > Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

    - [ ] [Docker Compose](https://github.com/docker/compose)
      > Docker Compose is a tool for defining and running multi-container Docker applications.

2. Module Manager

    - [x] [Helm Charts](https://helm.sh/)
      > Helm is a package manager for Kubernetes that simplifies the deployment of applications on a Kubernetes cluster.

3. Secrets Manager

    - [x] [External Secrets Operator](https://external-secrets.io/)
      > External Secrets Operator is a Kubernetes operator that integrates external secret management systems like AWS Secrets Manager, HashiCorp Vault, Google Secrets Manager, Azure Key Vault, and many others. The operator reads information from external APIs and automatically injects the values into a Kubernetes Secret.

    - [ ] [HashiCorp Vault](https://github.com/hashicorp/vault)
      > HashiCorp Vault is a tool for securely accessing secrets, such as API keys, passwords, and certificates. It provides a centralized solution for managing secrets and sensitive data, allowing users to store, access, and control secrets across different environments. Vault supports various authentication methods, encryption backends, and secret engines, making it a versatile solution for managing secrets in modern applications.

    - [ ] [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
      > Kubernetes Secrets is a built-in feature of Kubernetes that allows users to store and manage sensitive information, such as passwords, OAuth tokens, and SSH keys, in a secure manner. Secrets are stored in the Kubernetes API server and can be accessed by pods and containers running in the cluster. Kubernetes Secrets provides a way to decouple sensitive data from application code, enhancing security and flexibility.

4. Policy Manager

    - [x] [Kyverno](https://kyverno.io/)
      > Kyverno is a policy engine designed for Kubernetes. It allows you to manage policies as Kubernetes resources and no new language is required to write policies. Kyverno policies can validate, mutate, and generate Kubernetes resources.

    - [ ] [Open Policy Agent (OPA)](https://github.com/open-policy-agent/opa)
      > Open Policy Agent (OPA) is an open-source, general-purpose policy engine that enables policy-based control across a wide range of systems and applications. OPA allows users to define policies using a high-level declarative language called Rego, which can be used to enforce rules and make decisions based on various inputs, such as API requests, configuration files, and runtime data.

    - [ ] [HashiCorp Sentinel](https://registry.terraform.io/browse/policies)
      > HashiCorp Sentinel is a framework that enables fine-grained, logic-based policy decisions to be integrated into the workflow of HashiCorp products. Sentinel allows users to define policies using a high-level language, enabling organizations to enforce compliance, security, and operational best practices across their infrastructure and applications.

5. Test Frameworks

    - [ ] [helm-unittest](https://github.com/helm-unittest/helm-unittest)
      > A Helm chart testing framework for unit testing Helm charts.

6. Repository Strategy

    - [x] [Modular Monolith](../articles/repository-strategies.md#12-modular-monolith)
      > The Modular Monolith organizes a single application into distinct, self-contained modules within one repository.

7. Conventions & Style Guides
    - [x] [Recommended Labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)
      > A common set of labels allows tools to work interoperably and describing objects in a common manner.

    - [x] [Documentation Style Guide](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)
      > A style guidelines for the writing of Kubernetes documentation.

    - [x] [Kubernetes SIG](https://kubectl.docs.kubernetes.io/)
      > Kubernetes SIG (Special Interest Groups) provides Guides and API References for Kubectl and Kustomize.

### 1.9. Infrastructure Management

1. Provisioning Manager

    - [x] [Terraform](https://github.com/hashicorp/terraform)
      > Terraform is an open-source Infrastructure-as-Code (IaC) tool that enables users to define and provision infrastructure resources using a declarative configuration language.

    - [ ] [OpenTofu](https://github.com/opentofu/opentofu)
      > OpenTofu is a community-driven fork of Terraform, created to continue the development of Terraform after HashiCorps decision to change the license.

2. Module Manager

    - [x] [Terraform Modules](https://registry.terraform.io/browse/modules)
      > Modules are self-contained packages of Terraform configurations.

      - [x] [Terraform AWS Modules](https://github.com/terraform-aws-modules)
        > A collection of reusable Terraform modules for managing AWS resources.

3. Registry

    - [x] [Terraform Registry](https://registry.terraform.io)
      > A repository for Terraform modules and providers to share and reuse Terraform configurations.

4. Analysis

    - [x] terraform fmt
      > Terraform built-in formatting of configuration in the standard style.

    - [x] [TFLint](https://github.com/terraform-linters/tflint)
      > Linting of configuration files.

    - [x] [trivy](https://github.com/aquasecurity/trivy)
      > Scanning of configuration files for vulnerabilities.

5. Test Frameworks

    - [x] [terraform test](https://developer.hashicorp.com/terraform/language/tests)
      > Terraform built-in TDD-style testing by writing Terraform `integration tests`, `unit tests`, or `mocks` to verify Infrastructure-as-Code (IaC) configurations.

    - [ ] [Terratest](https://github.com/gruntwork-io/terratest)
      > TDD-style testing for Infrastructure-as-Code (IaC) configurations.

    - [ ] [terraform-compliance](https://github.com/terraform-compliance/cli)
      > BDD-style testing for Infrastructure-as-Code (IaC) configurations.

6. Documantion

    - [x] [terraform-docs](https://github.com/terraform-docs/terraform-docs)
      > A tool for generating documentation for Terraform modules.

7. Repository Strategy

    - [x] [Modular Monolith](../articles/repository-strategies.md#12-modular-monolith)
      > The Modular Monolith organizes a single application into distinct, self-contained modules within one repository.

8. Conventions & Style Guides
    - [x] [HashiCorp Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style)
      > The HashiCorp Terraform Style Guide is a comprehensive resource that provides best practices and guidelines for writing Terraform configurations.

### 1.10. Configuration Management

1. Configuration Manager

    - [x] [Ansible](https://github.com/ansible/ansible)
      > Ansible is an open-source Configuration-as-Code (CaC) tool to streamline the process of configuration management, application deployment, and task automation.

2. Module Manager

    - [x] [Ansible Collections](https://github.com/ansible-collections)
      > Ansible Collections are curated and pre-packaged Ansible content that includes playbooks, roles, modules, and plugins.

      - [ ] [OpenStack-Ansible](https://github.com/openstack/openstack-ansible)
        > Ansible Collection for OpenStack of Ansible playbooks and roles designed to deploy and manage OpenStack cloud infrastructure.

3. Registry

    - [x] [Ansible Galaxy](https://galaxy.ansible.com)
      > A repository for Ansible roles and collections to share and reuse Ansible content, such as roles (predefined automation tasks) and collections (bundles of roles, modules, and plugins).

4. Analysis

    - [x] [ansible-lint](https://github.com/ansible/ansible-lint)
      > Ansible-lint is a static analysis tool for Ansible playbooks and roles.

5. Test Frameworks

    - [x] [ansible-test](https://github.com/nylas/ansible-test)
      > Ansible-test is a testing framework for Ansible that allows developers to write and run tests for their Ansible roles and playbooks.

    - [ ] [Molecule](https://github.com/ansible/molecule)
      > Molecule is a testing framework for Ansible roles that provides a way to create and manage test environments.

6. Repository Strategy

    - [x] [Modular Monolith](../articles/repository-strategies.md#12-modular-monolith)
      > The Modular Monolith organizes a single application into distinct, self-contained modules within one repository.

### 1.11. Documentation Management

1. Markup Language

    - [x] [Markdown](https://github.com/commonmark/commonmark-spec)
      > Markdown is a lightweight markup language with plain text formatting syntax.

      > [!NOTE]
      > Documentation uses [CommonMark Flavored Markdown](https://commonmark.org/) renderers.

2. Static Site Generator (SSG)

    - [x] [MkDocs](https://github.com/mkdocs/mkdocs)
      > MkDocs is a Static Site Generator (SSG) designed for building project documentation based on Markdown files and converts them into a full-featured website.

3. Hosting Platform

    - [x] [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/)
      > GitLab Pages is used for hosting the static documentation website generated by Static Site Generators (SSG).

    - [x] [GitHub Pages](https://pages.github.com/)
      > GitHub Pages is used for hosting the static documentation website generated by Static Site Generators (SSG).

4. Analysis

    - [x] markdownlint
      > A static analysis tool for Markdown files that ensures adherence to formatting rules and conventions.

5. Conventions & Style Guides

    - [x] [Google Markdown Style Guide](https://google.github.io/styleguide/docguide/style.html)
      > A comprehensive guide to writing clear, concise, and well-formatted documentation using Markdown.

    - [ ] [GitLab Documentation Style Guide](https://docs.gitlab.com/ee/development/documentation/styleguide/)
      > GitLabs style guide for writing documentation, providing guidelines on structure, formatting, and best practices for clarity and consistency.

### 1.13. GitOps

1. Frameworks

    - [ ] [Terraform Enterprise](https://developer.hashicorp.com/terraform/enterprise)
      > Terraform Enterprise is a commercial version of Terraform that provides additional features for managing infrastructure at scale.

    - [ ] [Spinnaker](https://github.com/spinnaker/spinnaker)
      > Spinnaker is an open-source continuous delivery platform that provides a comprehensive solution for deploying applications across multiple cloud providers.

    - [ ] [Argo CD](https://github.com/argoproj/argo-cd)
      > Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

    - [ ] [Flux](https://github.com/fluxcd/flux2)
      > Flux is a GitOps tool for Kubernetes that automates the deployment of applications and infrastructure changes.

### 1.14. Cloud Computing

#### 1.14.1. Hosting

1. Provisioning Manager

    - [x] [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
      > The AWS provider is used to interact with the resources supported by Amazon Web Services (AWS). It allows users to manage AWS services such as EC2, S3, RDS, and more using Terraform.

    - [ ] [OpenStack](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs)
      > The OpenStack provider is used to interact with the resources supported by OpenStack. It allows users to manage OpenStack services such as compute, networking, and storage using Terraform.

    - [ ] [Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
      > The Azure provider is used to interact with the resources supported by Microsoft Azure. It allows users to manage Azure services such as virtual machines, storage accounts, and networking using Terraform.

    - [ ] [Google Cloud Platform (GCP)](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
      > The Google Cloud Platform (GCP) provider is used to interact with the resources supported by Google Cloud Platform. It allows users to manage GCP services such as Compute Engine, Cloud Storage, and BigQuery using Terraform.

### 1.15. Observability

1. Monitoring/Metrics

    Timestamped, structured records of system performance (e.g., CPU usage, memory consumption).

    - [x] [Prometheus](https://github.com/prometheus/prometheus)
      > Prometheus is an open-source monitoring and alerting toolkit designed for reliability and scalability.

    - [x] [Prometheus Alertmanager](https://github.com/prometheus/alertmanager)
      > Prometheus Alertmanager is an open-source tool that handles alerts generated by Prometheus.

    - [x] [Prometheus Node Exporter](https://github.com/prometheus/node_exporter)
      > Prometheus Node Exporter is an open-source tool that collects hardware and operating system metrics from Linux-based systems.

    - [ ] [Prometheus Blackbox Exporter](https://github.com/prometheus/blackbox_exporter)
      > Prometheus Blackbox Exporter is an open-source tool that allows users to probe endpoints over various protocols (HTTP, HTTPS, DNS, TCP, ICMP) and collect metrics about their availability and performance.

    - [x] [Grafana](https://github.com/grafana/grafana)
      > Grafana is an open-source analytics and monitoring platform that provides a powerful and flexible way to visualize and analyze time-series data.

2. Logging/Logs

    Timestamped, structured, unstructured or semi-structured records of system events (e.g., application logs, system logs, access logs).

    - [x] [Grafana Loki](https://github.com/grafana/loki)
      > Grafana Loki is an open-source log aggregation system designed to efficiently collect, store, and query logs from various sources.

    - [x] [Grafana Promtail](https://grafana.com/docs/loki/latest/send-data/promtail/)
      > Promtail is an open-source agent that collects logs from various sources and sends them to Grafana Loki for storage and analysis.

      > [!CAUTION]
      > Promtail is deprecated and will be replaced by [Grafana Alloy](https://grafana.com/docs/loki/latest/setup/migrate/migrate-to-alloy/).

3. Tracing/Traces

    Records of end-to-end request flows across distributed systems.

    - [ ] [Grafana Tempo](https://github.com/grafana/tempo)
      > Grafana Tempo is an open-source, high-scale distributed tracing backend designed to ingest and store trace data from various sources.

    - [ ] [Grafana Alloy](https://github.com/grafana/alloy)
      > Grafana Alloy is an open-source distribution of the OpenTelemetry Collector, designed to aggregate observability signals such as metrics, logs, and traces from various sources.

4. Profiles

    Records of resource utilization and performance characteristics (e.g., CPU, memory, I/O) at the code level (e.g., function execution times).

    > [!NOTE]
    > Profiles are not yet widely adopted in the industry, but they are gaining traction as a way to gain deeper insights into application performance and resource utilization.

5. Conventions & Style Guides

    - [ ] [OpenTelemetry](https://github.com/open-telemetry)
      > OpenTelemetry is an open-source observability framework that provides a set of APIs, libraries, agents, and instrumentation to collect and export telemetry data (metrics, logs, and traces) from applications.

    - [ ] [OpenMetrics](https://github.com/OpenObservability/OpenMetrics)
      > OpenMetrics is an open-source standard for transmitting metrics data in a consistent and efficient format.

    - [ ] [eBPF](https://ebpf.io/)
      > eBPF (Extended Berkeley Packet Filter) is a powerful technology that allows developers to run custom code in the Linux kernel without modifying the kernel itself.

### 1.16. Database

1. Relational Database (SQL)

   - [x] [PostgreSQL](https://github.com/postgres/postgres)
     > A robust, open-source object–relational database system that extends **SQL** with advanced features. PostgreSQL is widely adopted for `Online Transaction Processing (OLTP)`, offering `ACID` compliance, complex query support, extensibility, and strong indexing for high-performance workloads.

   - [ ] [SQLite](https://github.com/sqlite/sqlite)
     > A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. Ideal for embedded applications, local development, and testing.

     ORM (Object–Relational Mappers)

     - [x] [GORM](https://gorm.io/)
       > Active Record–inspired ORM with support for associations, migrations, and query building for Go.

     - [x] [SQLAlchemy](https://www.sqlalchemy.org/)
       > The Python SQL Toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL.

     - [ ] [Ent](https://entgo.io/)
       > An entity framework for Go, a powerful ORM for modeling and querying data.

2. Non-Relational Database (NoSQL)

   - [ ] [MongoDB](https://github.com/mongodb/mongo)
     > A distributed, document-oriented database that stores data in flexible JSON-like structures. MongoDB is suited for semi-structured or unstructured datasets, emphasizing horizontal scalability, automatic sharding, and high availability for modern **NoSQL** workloads.

     ODM (Object–Document Mappers)

     - [ ] [Beanie](https://github.com/roman-right/beanie)
       > An asynchronous Python object-document mapper (ODM) for MongoDB, built on top of Motor and Pydantic.

3. In-Memory Database (Caching / Message Broker)

   - [x] [Redis](https://github.com/redis/redis)
     > An open-source, in-memory data structure store used as a cache, database, and message broker. Redis supports advanced data types, persistence, clustering, and pub/sub messaging, making it ideal for low-latency caching and real-time event-driven architectures.

   - [ ] [Memcached](https://github.com/memcached/memcached)
     > A high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.

## 2. References

- Sentenz [Manager Tools](../articles/manager-tools.md) article.
- Sentenz [Repository Strategies](../articles/repository-strategies.md) article.
- Sentenz [Everything as Code (XaC)](../articles/everything-as-code-xac.md) article.
- Sentenz [Everything Ops (XOps)](../articles/everything-ops-xops.md) article.
