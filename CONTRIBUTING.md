# Contributing

Contribution guidelines and project management tools.

- [1. AI Agents](#1-ai-agents)
- [2. Skills Manager](#2-skills-manager)
  - [2.1. Skills CLI](#21-skills-cli)
- [3. Task Runner](#3-task-runner)
  - [3.1. Make](#31-make)
- [4. Bootstrap](#4-bootstrap)
  - [4.1. Scripts](#41-scripts)
- [5. Dev Containers](#5-dev-containers)
- [6. Release Manager](#6-release-manager)
  - [6.1. Semantic-Release](#61-semantic-release)
- [7. Update Manager](#7-update-manager)
  - [7.1. Renovate](#71-renovate)
  - [7.2. Dependabot](#72-dependabot)
- [8. Secrets Manager](#8-secrets-manager)
  - [8.1. SOPS](#81-sops)
- [9. Container Manager](#9-container-manager)
  - [9.1. Docker](#91-docker)
- [10. Policy Manager](#10-policy-manager)
  - [10.1. Conftest](#101-conftest)
- [11. Supply Chain Manager](#11-supply-chain-manager)
  - [11.1. Trivy](#111-trivy)

## 1. AI Agents

AI Agents are automated tools that assist in various development tasks such as code generation, testing, and documentation.

1. Insights and Details

    - [AGENTS.md](AGENTS.md)
      > Instructions for AI coding agents working with the project.

    - [.agents/skills/](.agents/skills/)
      > Directory containing AI agent skill definitions and configurations.

2. Usage and Instructions

    - Implicit Invocation
      > AI Agents can be implicitly invoked based on file paths, programming languages, or specific keywords in user prompts.

      ```plaintext
      .agents/skills/<skill-name>/SKILL.md
      ```

    - Explicit Invocation
      > AI Agents can be explicitly invoked by specifying the skill name in user prompts.

      ```plaintext
      @agent <skill-name> <task-description>
      ```

## 2. Skills Manager

### 2.1. Skills CLI

[Skills CLI](https://skills.sh/) is a command-line tool for managing AI agent skills in development projects.

1. Insights and Details

    - [Sentenz Skills](https://github.com/sentenz/skills)
      > Reusable AI agent skills for various development tasks.

2. Usage and Instructions

    - Tasks

      ```bash
      make skills-add
      ```

      ```bash
      make skills-update
      ```

## 3. Task Runner

### 3.1. Make

[Make](https://www.gnu.org/software/make/) is a automation tool that defines and manages tasks to streamline development workflows.

1. Insights and Details

    - [Makefile](Makefile)
      > Makefile defining tasks for building, testing, and managing the project.

2. Usage and Instructions

    - Tasks

      ```bash
      make help
      ```

      > [!NOTE]
      > - Each task description must begin with `##` to be included in the task list.

      ```plaintext
      $ make help

      Tasks
              A collection of tasks used in the current project.

      Usage
              make <task>

              bootstrap         Initialize a software development workspace with requisites
              setup             Install and configure all dependencies essential for development
              teardown          Remove development artifacts and restore the host to its pre-setup state
      ```

## 4. Bootstrap

### 4.1. Scripts

1. Insights and Details

    - [scripts/](scripts/README.md)
      > Provides scripts to bootstrap, setup, and teardown a software development workspace with requisites.

2. Usage and Instructions

    - Tasks

      ```bash
      make bootstrap
      ```

      ```bash
      make setup
      ```

      ```bash
      make teardown
      ```

## 5. Dev Containers

1. Insights and Details

    - [.devcontainer/](.devcontainer/README.md)
      > Provides Dev Containers as a consistent development environment using Docker containers.

2. Usage and Instructions

    - Tasks

      ```bash
      # TODO
      # make devcontainer-go
      # make devcontainer-cpp
      # make devcontainer-python
      ```

## 6. Release Manager

### 6.1. Semantic-Release

[Semantic-Release](https://github.com/semantic-release/semantic-release) automates the release process by analyzing commit messages to determine the next version number, generating changelog and release notes, and publishing the release.

1. Insights and Details

    - [.releaserc.json](.releaserc.json)
      > Configuration file for Semantic-Release specifying release rules and plugins.

2. Usage and Instructions

    - CI/CD

      ```yaml
      uses: sentenz/actions/semantic-release@latest
      ```

## 7. Update Manager

### 7.1. Renovate

[Renovate](https://github.com/renovatebot/renovate) automates dependency updates by creating merge requests for outdated dependencies, libraries and packages.

1. Insights and Details

    - [renovate.json](renovate.json)
      > Configuration file for Renovate specifying update rules and schedules.

2. Usage and Instructions

    - CI/CD

      ```yaml
      uses: sentenz/actions/renovate@latest
      ```

### 7.2. Dependabot

[Dependabot](https://github.com/dependabot/dependabot-core) automates dependency updates by creating pull requests for outdated dependencies, libraries and packages.

1. Insights and Details

    - [.github/dependabot.yml](.github/dependabot.yml)
      > Configuration file for Dependabot specifying update rules and schedules.

## 8. Secrets Manager

### 8.1. SOPS

[SOPS (Secrets OPerationS)](https://github.com/getsops/sops) is a tool for managing and encrypting sensitive data such as passwords, API keys, and other secrets.

1. Insights and Details

    - [.sops.yaml](.sops.yaml)
      > Configuration file for SOPS specifying encryption rules and key management.

2. Usage and Instructions

    - GPG Key Pair Generation

      - Tasks
        > Generate a new key pair to be used with SOPS.

        > [!NOTE]
        > The UID can be customized via the `SECRETS_SOPS_UID` variable (defaults to `sops-dx`).

        ```bash
        make secrets-gpg-generate SECRETS_SOPS_UID=<uid>
        ```

    - GPG Public Key Fingerprint

      - Tasks
        > Print the  GPG Public Key fingerprint associated with a given UID.

        ```bash
        make secrets-gpg-show SECRETS_SOPS_UID=<uid>
        ```

      - [.sops.yaml](.sops.yaml)
        > The GPG UID is required for populating in `.sops.yaml`.

        ```yaml
        creation_rules:
          - pgp: "<fingerprint>" # <uid>
        ```

    - SOPS Encrypt/Decrypt

      - Tasks
        > Encrypt/decrypt one or more files in place using SOPS.

        ```bash
        make secrets-sops-encrypt <files>
        ```

        ```bash
        make secrets-sops-decrypt <files>
        ```

## 9. Container Manager

### 9.1. Docker

[Docker](https://github.com/docker) containerization tool to run applications in isolated container environments and execute container-based tasks.

1. Insights and Details

    - [Dockerfile](Dockerfile)
      > Dockerfile defining the container image for the project.

2. Usage and Instructions

    - CI/CD

      ```yaml
      # TODO
      ```

    - Tasks

      ```bash
      # TODO
      ```

## 10. Policy Manager

### 10.1. Conftest

[Conftest](https://www.conftest.dev/) is a **Policy as Code (PaC)** tool to streamline policy management for improved development, security and audit capability.

1. Insights and Details

    - [conftest.toml](conftest.toml)
      > Configuration file for Conftest specifying policy paths and output formats.

    - [tests/policy/](tests/policy/)
      > Directory contains Rego policies for Conftest to enforce best practices and compliance standards.

2. Usage and Instructions

    - CI/CD

      ```yaml
      uses: sentenz/actions/regal@latest
      ```

      ```yaml
      uses: sentenz/actions/conftest@latest
      ```

    - Tasks

      ```bash
      make policy-regal-lint <filepath>
      ```

      ```bash
      make policy-conftest-test <filepath>
      ```

## 11. Supply Chain Manager

### 11.1. Trivy

[Trivy](https://github.com/aquasecurity/trivy) is a comprehensive security scanner for vulnerabilities, misconfigurations, and compliance issues in container images, filesystems, and source code.

1. Insights and Details

    - [trivy.yaml](trivy.yaml)
      > Configuration file for Trivy specifying scan settings and options.

    - [.trivyignore](.trivyignore)
      > File specifying vulnerabilities to ignore during Trivy scans.

2. Usage and Instructions

    - CI/CD

      ```yaml
      uses: sentenz/actions/trivy@latest
      ```

    - Tasks

      ```bash
      make sast-trivy-fs <path>
      ```

      ```bash
      make sast-trivy-sbom-cyclonedx-fs <path>
      ```

      ```bash
      make sast-trivy-sbom-scan <sbom_path>
      ```

      ```bash
      make sast-trivy-sbom-license <sbom_path>
      ```
