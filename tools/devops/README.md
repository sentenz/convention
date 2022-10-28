# DevOps

A service for DevOps operations.

Supported operations:

- [x] Continuous Pipelines
- [x] Git Hooks
- [x] Code Analysis
- [x] Containers
- [x] Makefile

## Setup

Integrate the DevOps service repository into a base repository with `git submodule` dependency or any other appropriate method.

Run the following command to setup the DevOps service into the base repository:

```bash
cd pathto/devops/scripts 
chmod +x setup.sh
./setup.sh
```

The commands of the initialized DevOps service are available as `make <target>` in the `Makefile` of a base repository.
