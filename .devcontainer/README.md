# `/.devcontainer`

Images intended for use with tools and services that support the [Dev Container Specification](https://containers.dev/).

> If the user wants to switch to a different `devcontainer.json` file after selecting one, they can do so by using the `Reopen in Container` command in the Command Palette (`Ctrl+Shift+P` on Windows/Linux or `Cmd+Shift+P` on macOS) and selecting a different `devcontainer.json` file.

- [1. Images](#1-images)
- [2. Properties](#2-properties)

## 1. Images

[Docker Dev Containers Images](https://hub.docker.com/_/microsoft-devcontainers) in tools and services that support the dev container specification. Their contents, and corresponding `devcontainer.json` files are typically tied to releases at [GitHub Dev Containers Images](https://github.com/devcontainers/images).

- `/base`
  > A simple Ubuntu container with Git and other common utilities installed.

- `/cpp`
  > Develop C++ applications on Linux. Includes Debian C++ build tools.

- `/go`
  > A dev container spec-supported image for working with Go. Includes appropriate runtime args, common tools, extensions, and dependencies.

- `/typescript-node`
  > Develop Node.js based applications. Includes Node.js, eslint, nvm, and yarn.

## 2. Properties

[Dev Container metadata reference](https://containers.dev/implementors/json_reference/) for `devcontainer.json` file contains any needed metadata and settings required to configurate a development container for a given well-defined tool and runtime stack.

- `name`
  > A name for the dev container displayed in the UI.

- `image`
  > Development container images for use with [VS Code Remote - Containers](https://hub.docker.com/_/microsoft-vscode-devcontainers) from [dev container images](https://github.com/devcontainers/images) repository on a container registry ([DockerHub](https://hub.docker.com/), [GitHub Container Registry](https://docs.github.com/packages/guides/about-github-container-registry), [Azure Container Registry](https://azure.microsoft.com/services/container-registry/)) that devcontainer.json supporting services / tools should use to create the dev container.

- `runArgs`
  > An array of [Docker CLI arguments](https://docs.docker.com/engine/reference/commandline/run/) that should be used when running the container.

- `forwardPorts`
  > An array of port `numbers` or `host:port` values.

- `preCreateCommand`
  > A command to run locally (i.e. host machine, cloud VM) before anything else. This command is run before `onCreateCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.
  >
  > NOTE This is a good option for downloading the container image or mounting a volume.

- `onCreateCommand`
  > A command to run when creating the container. This command is run after `initializeCommand` and before `updateContentCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.

- `updateContentCommand`
  > A command to run when creating the container and rerun when the workspace content was updated while creating the container. This command is run after `onCreateCommand` and before `postCreateCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.

- `postCreateCommand`
  > A command to run after creating the container. This command is run after `updateContentCommand` and before `postStartCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.

- `postStartCommand`
  > A command to run after starting the container. This command is run after `postCreateCommand` and before `postAttachCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.
  >
  > NOTE This is a good option for starting long-running processes, running commands that require user interaction, or running commands that need to access the container's filesystem or resources.

- `postAttachCommand`
  > A command to run when attaching to the container. This command is run after `postStartCommand`. If this is a single string, it will be run in a shell. If this is an array of strings, it will be run as a single command without shell. If this is an object, each provided command will be run in parallel.
  >
  > NOTE This is a good option for starting long-running processes, running commands that require user interaction, or running commands that need to access the container's filesystem or resources.

- `remoteUser`
  > Overrides the default user that devcontainer.json supporting services tools / runs as in the container.
