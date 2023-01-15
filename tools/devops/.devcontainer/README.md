# `/.devcontainer`

- devcontainer.json
  > An container file for vs code editor only.
  >
  > For format details, see [microsoft devcontainer properties](https://aka.ms/devcontainer.json).
  > For preconfigured containers, see [microsoft vscode-dev-containers](https://github.com/microsoft/vscode-dev-containers/tree/v0.202.5/containers/ubuntu) repository.
  >
  > Contains the commands, refer to [devcontainer metadata reference](https://containers.dev/implementors/json_reference/):
  >
  > - `build.dockerfile`: The location of a Dockerfile that defines the contents of the container. The path is relative to the devcontainer.json file.
  > - `build.context`: Path that the Docker build should be run from relative to devcontainer.json.
  > - `settings`: Set default container specific settings.json values on container create.
  > - `features`: See features on [devcontainers](https://github.com/devcontainers/features/tree/main/src) repository.
  > - `extensions`: Add the IDs of extensions you want installed when the container is created.
  > - `forwardPorts`: A list of ports inside the container available locally.
  > - `onCreateCommand`: Run command on first of the newly built container.
  > - `postCreateCommand`: Run commands after the container is created.
  > - `remoteUser `: Overrides the user that devcontainer.json supporting services tools / runs as in the container (along with sub-processes like terminals, tasks, or debugging). Does not change the user the container as a whole runs as which can be set using containerUser. 
