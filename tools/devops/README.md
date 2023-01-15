# DevOps

A service for DevOps operations.

- [1. Setup](#1-setup)
- [2. Usage](#2-usage)

Supported operations:

- [x] Code Analysis
  > Safety-related analysis, code quality analysis, syntax style review tools, or dead code detection tools.
  >
  > - [Linter](internal/README.md#linter)
  > - [Sanitizer](internal/README.md#sanitizer)
  > - [Security](internal/README.md#security)

- [x] Continuous Pipelines
  > Pipeline stages in an automated software development and deployment flow.
  >
  > - [Azure Pipelines](.azure/README.md)
  > - [GitHub Actions workflows](.github/workflows/README.md)

- [x] Git Hooks
  > [Hooks](githooks/README.md) are used by Git to trigger actions at certain points in git command.

- [x] Containers
  >  Ready to use container [templates](build/container/README.md).

- [x] Makefile
  > Collection of [make targets](Makefile) used for this DevOps service repository.

## 1. Setup

Integrate the DevOps service repository into a base repository with `git submodule` dependency or any other appropriate method.

Run the following command to setup the DevOps service into the base repository:

```bash
cd path/to/devops/scripts 
chmod +x setup.sh
./setup.sh
```

<!-- TODO(AK) Check toe correct usage of `git submodule`
## 2. Install

1. Add a Git Submodule

   ```bash
   clone --sparse --filter=blob:none --no-checkout --depth 1 -b <branch> <remote-respoitory-url> <relativ-local-folder-path>
   git submodule add -b <branch> <remote-respoitory-url> <relativ-local-folder-path>
   ```

   Example:

   ```bash
   git clone --sparse --filter=blob:none --no-checkout --depth 1 -b scripts/validate https://github.com/sentenz/essay.git scripts/validate
   git submodule add -b scripts/validate https://github.com/sentenz/essay.git scripts/validate
   ```

   Modify `.git/modules/scripts/validate/info/sparse-checkout`.

   ```bash
   git submodule absorbgitdirs
   git -C scripts/validate config core.sparseCheckout true
   echo 'validate/*' >> .git/modules/scripts/validate/info/sparse-checkout
   git submodule update --force --checkout scripts/validate
   ```

2. Pull a Git Submodule

   ```bash
   git submodule update --init --recursive
   ```

3. Status of a Git Submodule

   Check the status of a submodule:

   ```bash
   git submodule status
   ```

   The output should look like below:

   ```bash
   <sha> scripts/validate (heads/scripts/validate)
   ```

   If the output is empty, start from the beginning.

## 3. Uninstall

1. Remove a Git Submodule

   ```bash
   git submodule deinit scripts/validate
   git rm --cached scripts/validate
   ```

## 4. Update

1. Update a Git Submodule

   ```bash
   git submodule update --remote --recursive --merge
   ```
-->

## 2. Usage

The commands of the initialized DevOps service are available as `make <target>` in the Makefile of a base repository.

Run `make help` in the terminal to see the full list of commands.

- Code Analysis

  To perform analysis of local staged files run the following command:

  ```bash
  make run-linter-staged
  ```

- Git Hooks

  Triggers custom scripts in `/githooks` when certain Git actions occur.

- Continuous Pipelines

  - In Azure the pipelines in `/.azure` need to be added in Azure Pipelines service.
  - In GitHub the `/.github/workflows` is a automated process that will run as configured on Pull Request (PR).
