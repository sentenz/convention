# `/container`

- devcontainer.dockerfile
  > An container image for `.devcontainer.json` file.
  >
  > Contains the commands:
  >
  > - `ARG`: Update `VARIANT` to pick an Ubuntu: jammy, ubuntu-22.04, focal, ubuntu-20.04, bionic, ubuntu-18.04 on local arm64/Apple Silicon.
  > - `FROM`: Set the [vs code baseImage containers](https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/cpp/.devcontainer/base.Dockerfile) to use for subsequent instructions.
  >
  > NOTE The repository is mounted after the container is started. To run commands based on files of the repository use the [lifecycle](https://code.visualstudio.com/docs/remote/devcontainerjson-reference#_lifecycle-scripts) scripts in `.devcontainer.json`.
