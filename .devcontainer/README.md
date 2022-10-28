# `/.devcontainer`

- devcontainer.json
  > An container file for vs code editor only.
  >
  > For format details, see [microsoft devcontainer](https://aka.ms/devcontainer.json).
  > For config options, see [microsoft vscode-dev-containers](https://github.com/microsoft/vscode-dev-containers/tree/v0.202.5/containers/ubuntu) repository.
  >
  > Contains the commands:
  >
  > - `dockerfile`: Set the docker container file for the devcontainer.
  > - `args`: Update `VARIANT` to pick an Ubuntu: jammy, ubuntu-22.04, focal, ubuntu-20.04, bionic, ubuntu-18.04 on local arm64/Apple Silicon.
  > - `settings`: Set default container specific settings.json values on container create.
  > - `extensions`: Add the IDs of extensions you want installed when the container is created.
  > - `onCreateCommand`: Run command on first of the newly built container.
  > - `postCreateCommand`: Run commands after the container is created.
  > - `forwardPorts`: A list of ports inside the container available locally.
  > - `features`: See features on [devcontainers](https://github.com/devcontainers/features/tree/main/src) repository.
  > - `remoteUser`: The user VS Code Server will be started with. The default is the same user as the container.
