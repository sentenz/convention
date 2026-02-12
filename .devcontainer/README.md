# `.devcontainer/`

The `.devcontainer/` directory contains configuration files for setting up a [Development Containers](https://containers.dev/) environment.

- [1. Details](#1-details)
  - [1.1. Dev Containers](#11-dev-containers)
- [2. References](#2-references)

## 1. Details

### 1.1. Dev Containers

- `base-ubuntu/`
  > Develop [Ubuntu](https://github.com/devcontainers/images/tree/main/src/base-ubuntu) Linux applications in a container.

> [!NOTE]
> The `devcontainer.json` runs the `bootstrap` and `setup` tasks to initialize and configure the development environment.
>
> ```json
> // ...
> "postCreateCommand": "sudo make bootstrap && sudo make setup",
> // ...
> ```

## 2. References

- Dev Container [Features](https://containers.dev/features) page.
- Dev Container [Templates](https://containers.dev/templates) page.
- Dev Container [Specification](https://containers.dev/implementors/spec/) page.
- GitHub [Dev Containers Images](https://github.com/devcontainers/images) repository.
