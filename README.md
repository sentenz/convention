# Convention

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Convention is a collection of generel articles, conventions and guides for software development as a reference to follow standardized approaches in projects.

- [1. Details](#1-details)
  - [1.1. Prerequisites](#11-prerequisites)
  - [1.2. Static Site Generator (SSG)](#12-static-site-generator-ssg)
- [2. Contribute](#2-contribute)
- [3. Troubleshoot](#3-troubleshoot)
  - [3.1. TODO](#31-todo)
- [4. References](#4-references)

## 1. Details

### 1.1. Prerequisites

- [Git](https://git-scm.com/)
  > Distributed version control system for tracking source code changes.

  ```bash
  sudo apt install git
  ```

- [Make](https://www.gnu.org/software/make/)
  > Task automation tool to manage build processes and workflows.

  ```bash
  sudo apt install make
  ```


### 1.2. Static Site Generator (SSG)

The project uses [MkDocs](https://www.mkdocs.org/) with the Material theme and content sourced from the [`content/`](content/) directory.

- Dynamic navigation
  > The top-level navigation sections are generated automatically from subfolders in `content/` using a custom MkDocs hook.

- CommonMark support
  > A custom MkDocs hook renders pages with `markdown-it-py` using the `commonmark` preset to provide CommonMark-compatible parsing.

- Build

  ```bash
  mkdocs build --strict
  ```

- Serve locally

  ```bash
  mkdocs serve
  ```

## 2. Contribute

[CONTRIBUTING.md](CONTRIBUTING.md) provides guidens and instructions for contributing to the project.

- [AI Agents](CONTRIBUTING.md#1-ai-agents)
  > Automated tools that assist in various development tasks such as code generation, testing, and documentation.

- [Skills Manager](CONTRIBUTING.md#2-skills-manager)
  > CLI tool for managing AI agent skills in development projects.

- [Task Runner](CONTRIBUTING.md#3-task-runner)
  > Make automation tool that defines and manages tasks to streamline development workflows.

- [Bootstrap](CONTRIBUTING.md#4-bootstrap)
  > Scripts to bootstrap, setup, and teardown a software development workspace with requisites.

- [Dev Containers](CONTRIBUTING.md#5-dev-containers)
  > Consistent development environments using Docker containers.

- [Release Manager](CONTRIBUTING.md#6-release-manager)
  > Semantic-Release automates the release process by analyzing commit messages.

- [Update Manager](CONTRIBUTING.md#7-update-manager)
  > Renovate and Dependabot automate dependency updates by creating pull requests.

- [Policy Manager](CONTRIBUTING.md#10-policy-manager)
  > Conftest for policy-as-code enforcement.

- [Supply Chain Manager](CONTRIBUTING.md#11-supply-chain-manager)
  > Trivy for security scanning of vulnerabilities, misconfigurations, and compliance issues.

## 3. Troubleshoot

### 3.1. TODO

TODO

## 4. References

- Sentenz [Template DX](https://github.com/sentenz/template-dx) repository.
- Sentenz [Actions](https://github.com/sentenz/actions) repository.
- Sentenz [Skills](https://github.com/sentenz/skills) repository.
- Sentenz [Manager Tools](https://github.com/sentenz/convention/issues/392) article.
