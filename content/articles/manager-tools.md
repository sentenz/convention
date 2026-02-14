# Manager Tools

Tools designed to streamline and automate the DevOps lifecycle.

- [1. Category](#1-category)
  - [1.1. Git Hooks Manager](#11-git-hooks-manager)
  - [1.2. Dependency Manager](#12-dependency-manager)
  - [1.3. Package Manager](#13-package-manager)
  - [1.4. Module Manager](#14-module-manager)
  - [1.5. Dependency Update Manager](#15-dependency-update-manager)
  - [1.6. Release Manager](#16-release-manager)
  - [1.7. Context / Environment Manager](#17-context--environment-manager)
  - [1.8. Dotfile Manager](#18-dotfile-manager)
  - [1.9. Policy / Compliance Manager](#19-policy--compliance-manager)
  - [1.10. Secrets Manager](#110-secrets-manager)
  - [1.11. Key Manager](#111-key-manager)
  - [1.12. Cache Manager](#112-cache-manager)
  - [1.13. Configuration Manager](#113-configuration-manager)
  - [1.14. Provisioning Manager](#114-provisioning-manager)
  - [1.15. Container Manager](#115-container-manager)
  - [1.16. Orchestration Manager](#116-orchestration-manager)
  - [1.17. Feature Manager](#117-feature-manager)
  - [1.18. API Manager](#118-api-manager)
  - [1.19. Task Manager / Runner](#119-task-manager--runner)
  - [1.20. Monorepo Manager](#120-monorepo-manager)
  - [1.21. Cluster Manager](#121-cluster-manager)
  - [1.22. State Manager](#122-state-manager)
  - [1.23. Documentation Generators](#123-documentation-generators)

## 1. Category

### 1.1. Git Hooks Manager

Manages Git hooks to automate tasks during the Git workflow.

- [Husky](https://typicode.github.io/husky/)
- [Lefthook](https://github.com/evilmartians/lefthook)
- [Pre-commit](https://pre-commit.com/)

### 1.2. Dependency Manager

Manages project dependencies and libraries for various programming languages.

1. JavaScript / Node.js

    - [npm](https://www.npmjs.com/)
    - [yarn](https://yarnpkg.com/)
    - [pnpm](https://pnpm.io/)

2. Python

    - [pip](https://pip.pypa.io/en/stable/)
    - [poetry](https://python-poetry.org/)
    - [uv](https://github.com/astral-sh/uv)

3. Rust

    - [Cargo](https://doc.rust-lang.org/cargo/)

4. Java

    - [Maven](https://maven.apache.org/)
    - [Gradle](https://gradle.org/)

5. C#/.NET

    - [NuGet](https://www.nuget.org/)

6. C/C++

    - [vcpkg](https://vcpkg.io/)
    - [Conan](https://conan.io/)

7. PHP

    - [Composer](https://getcomposer.org/)

8. Go

    - [Go Modules](https://go.dev/ref/mod)

9. Ruby

    - [Bundler](https://bundler.io/)

10. Language Agnostic

    - TODO

### 1.3. Package Manager

Manages system-level software installations, libraries, and binaries.

1. macOS/Linux

    - [Homebrew](https://brew.sh/)
    - [Nix/Nixpkgs](https://nixos.org/)

2. C/C++

    - [vcpkg](https://vcpkg.io/)
    - [Conan](https://conan.io/)
    - [Hunter](https://github.com/cpp-pm/hunter)
    - [Spack](https://spack.io/)

3. Linux

    - [apt](https://wiki.debian.org/Apt)
    - [dnf](https://dnf.readthedocs.io/en/latest/)
    - [pacman](https://wiki.archlinux.org/title/Pacman)

4. Windows

    - [Chocolatey](https://chocolatey.org/)
    - [Scoop](https://scoop.sh/)

### 1.4. Module Manager

Manages reusable modules or packages for specific platforms or ecosystems.

1. [Terraform Registry](https://registry.terraform.io)

    - [Terraform Modules](https://registry.terraform.io/browse/modules)

2. [Ansible Galaxy](https://galaxy.ansible.com)

    - Ansible Collections

3. Kubernetes

    - Helm Charts

4. [PowerShell Gallery](https://www.powershellgallery.com)

    - PowerShell Modules

### 1.5. Dependency Update Manager

Automates the process of checking for and applying updates to project dependencies.

- [Renovate](https://docs.renovatebot.com/)
- [Dependabot](https://github.com/dependabot)
- [Greenkeeper](https://github.com/greenkeeperio/greenkeeper)
- [PyUp](https://pyup.io/)
- [Tidelift](https://tidelift.com/)

### 1.6. Release Manager

Automates the release process, including versioning, changelog generation, and publishing.

- [semantic-release](https://github.com/semantic-release/semantic-release)
- [release-please](https://github.com/googleapis/release-please)
- [Changesets](https://github.com/changesets/changesets)
- [release-it](https://github.com/release-it/release-it)
- [GoReleaser](https://github.com/goreleaser/goreleaser)
- [git-cliff](https://github.com/orhun/git-cliff)
- [Auto](https://github.com/intuit/auto)

### 1.7. Context / Environment Manager

Manages environment variables and context-specific settings for development and deployment.

- [direnv](https://direnv.net/)
- [dotenv](https://github.com/motdotla/dotenv)
- [shadowenv](https://github.com/Shopify/shadowenv)

### 1.8. Dotfile Manager

Manages and synchronizes dotfiles across multiple systems.

- [Chezmoi](https://www.chezmoi.io/)
- [Stow](https://www.gnu.org/software/stow/)
- [Yadm](https://yadm.io/)

### 1.9. Policy / Compliance Manager

Manages and enforces policies and compliance rules across infrastructure and applications.

- [Open Policy Agent (OPA)](https://www.openpolicyagent.org/)
- [Conftest](https://www.conftest.dev/)
- [Gatekeeper](https://open-policy-agent.github.io/gatekeeper/) Kubernetes OPA
- [Kyverno](https://kyverno.io/) Kubernetes
- [Cedar](https://www.cedarpolicy.com/) AWS
- [Cerbos](https://cerbos.dev/)
- [Sentinel](https://developer.hashicorp.com/sentinel) HashiCorp

### 1.10. Secrets Manager

Manages sensitive information and secrets at rest, in transit, and in use.

- [SOPS](https://github.com/getsops/sops)
- [Bitwarden Secrets Manager](https://bitwarden.com/products/secrets-manager/)
- [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/)
- [Google Secret Manager](https://cloud.google.com/security/products/secret-manager)
- [Doppler](https://www.doppler.com/)

### 1.11. Key Manager

Manages cryptographic keys for encryption, decryption, and signing operations.

- [AWS KMS](https://aws.amazon.com/kms/)
- [HashiCorp Vault](https://developer.hashicorp.com/vault)
- [Google Cloud Key Management](https://cloud.google.com/kms)
- [Azure Key Vault](https://learn.microsoft.com/en-us/azure/key-vault/)
- [Age](https://age-encryption.org/)
- [Keycloak](https://www.keycloak.org/)
- [Bitwarden](https://bitwarden.com/)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)

### 1.12. Cache Manager

Manages caching mechanisms to improve performance and reduce latency.

1. Compiler Cache

    Accelerates build times by reusing compilation artifacts.

    - [ccache](https://ccache.dev/)
    - [sccache](https://github.com/mozilla/sccache)

2. Build Cache

    Container layer caching to speed up container image builds.

    - [BuildKit](https://github.com/moby/buildkit)

3. Distributed Cache

    Distributed Data Grids clustered caching for distributed state and data processing.

    - [Hazelcast](https://hazelcast.com/)
    - [Apache Ignite](https://ignite.apache.org/)

4. CDN Cache

    Content Delivery Network caching for static assets (images, CSS) and web content.

    - [Varnish](https://varnish-cache.org/)
    - [Squid](http://www.squid-cache.org/)

5. Proxy Cache

    Caching reverse proxies to improve web application performance.

    - [Nginx](https://www.nginx.com/)
    - [Traefik](https://doc.traefik.io/traefik/)
    - [Envoy](https://www.envoyproxy.io/)

6. In-Memory Cache

    High-performance storage for application state, sessions, and side-caching.

    - [Redis](https://redis.io/)
    - [Dragonfly](https://www.dragonflydb.io/)
    - [KeyDB](https://docs.keydb.dev/)
    - [Memcached](https://memcached.org/)

7. Database Cache

    Database caching extensions and tools to enhance database performance.

    - [Redis](https://redis.io/)
    - [PostgreSQL pg_prewarm](https://www.postgresql.org/docs/current/pgprewarm.html)

### 1.13. Configuration Manager

Manages configuration files and settings for infrastructure and applications.

- [Ansible](https://www.ansible.com/)
- [Chef](https://www.chef.io/)
- [Puppet](https://puppet.com/)
- [SaltStack](https://saltproject.io/)

### 1.14. Provisioning Manager

Manages the provisioning of infrastructure resources.

- [Terraform](https://www.terraform.io/)
- [Pulumi](https://www.pulumi.com/)
- [Crossplane](https://crossplane.io/)
- [AWS CDK](https://aws.amazon.com/cdk/)

### 1.15. Container Manager

Manages containerized applications and the lifecycle of containers (creation, running, stopping) on a host.

- [Docker](https://www.docker.com/)
- [Podman](https://podman.io/)
- [Buildah](https://buildah.io/)

### 1.16. Orchestration Manager

Manages the deployment, scaling, and operation of containerized applications.

- [kubectl](https://kubernetes.io/docs/reference/kubectl/), [kustomize](https://kustomize.io/) (Kubernetes)
- [Docker Compose](https://docs.docker.com/compose/)
- [OpenShift](https://www.openshift.com/)

### 1.17. Feature Manager

Manages feature flags and toggles to enable or disable features in applications.

- [LaunchDarkly](https://launchdarkly.com/)
- [Unleash](https://www.getunleash.io/)
- [Split](https://www.split.io/)
- [Flagsmith](https://flagsmith.com/)
- [ConfigCat](https://configcat.com/)

### 1.18. API Manager

Manages the creation, deployment, and monitoring of APIs, including gateways, traffic control, and developer portals.

- [Kong](https://konghq.com/)
- [Tyk](https://tyk.io/)
- [Google Apigee](https://cloud.google.com/apigee)
- [Postman](https://www.postman.com/)

### 1.19. Task Manager / Runner

Manages and automates the execution of tasks and workflows in development and deployment processes.

- [Just](https://github.com/casey/just)
- [Make](https://www.gnu.org/software/make/)
- [Task](https://taskfile.dev/)
- [Rake](https://ruby.github.io/rake/)
- [Invoke](https://www.pyinvoke.org/)

### 1.20. Monorepo Manager

Manages multiple projects within a single repository.

- [Nx](https://nx.dev/)
- [Turborepo](https://turbo.build/repo)
- [Rush](https://rushjs.io/)
- [Lerna](https://lerna.js.org/)
- [Bazel](https://bazel.build/)

### 1.21. Cluster Manager

Manages multiple clusters of servers or containers.

- [K9s](https://k9scli.io/) CLI
- [Lens](https://k8slens.dev/) GUI
- [Rancher](https://rancher.com/) Multi-cluster

### 1.22. State Manager

Manages distributed state and configuration for applications and services.

- [etcd](https://etcd.io/)
- [Zookeeper](https://zookeeper.apache.org/)
- [Eureka](https://github.com/Netflix/eureka)
- [Apache Curator](https://curator.apache.org/)
- [Zustand](https://github.com/pmndrs/zustand)

### 1.23. Documentation Generators

Generates documentation from source code, markdown files, or other formats to create user-friendly and navigable documentation sites.

1. Static Site Generators (SSG)

    Converts markdown or other content into static websites for documentation purposes.

    - [Hugo](https://gohugo.io/)
    - [MkDocs](https://www.mkdocs.org/)
    - [Docusaurus](https://docusaurus.io/)
    - [Jekyll](https://jekyllrb.com/)
    - [Eleventy](https://www.11ty.dev/)

2. API Documentation Generators

    Generates documentation specifically for APIs from code comments or specifications.

    - [Doxygen](https://www.doxygen.nl/)
    - [Sphinx](https://www.sphinx-doc.org/)
    - [DocFX](https://dotnet.github.io/docfx/)
    - [Typedoc](https://typedoc.org/)
    - [JSDoc](https://jsdoc.app/)
