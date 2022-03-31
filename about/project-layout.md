# Project Layout // TODO

- [C/C++](#cc)
- [Go](#go)
- [Python](#python)

## C/C++

// TODO

## Go

[Go Project Layout](https://github.com/golang-standards/project-layout) for applicationa. It is a set of common historical and emerging project layout patterns in the Go.

**NOTE** It's not an official standard defined by the core Go dev team

**Directories:**

- `/cmd`
  > Contains the main application entry point files for the project, with the directory name matching the name for the binary.

- `/internal`
  > Private application and library code.

- `/pkg`
  > Library code to use by external applications.

- `/vendor`
  > Application dependencies.

**Common Application Directories:**

- `/configs`
  > Configuration file templates or default configs.

- `/init`
  > System init (systemd, upstart, sysv) and process manager/supervisor (runit, supervisord) configs.

- `/scripts`
  > Scripts to perform various build, install, analysis, etc operations.

- `/build`
  > Packaging and Continuous Integration.
- `/deployments`
  > IaaS, PaaS, system and container orchestration deployment configurations and templates (docker-compose, kubernetes/helm, mesos, terraform, bosh).

- `/test`
  > Additional external test apps and test data.

**Other Directories:**

- `/docs`
  > Design and user documents (in addition to godoc generated documentation).

- `/tools`
  > Supporting tools for this project.

- `/examples`
  > Examples for your applications and/or public libraries.

- `/external`
  > External helper tools, forked code and other 3rd party utilities (e.g., Swagger UI).

- `/githooks`
  > Git hooks files.

- `/assets`
  > Other assets to go along with your repository (images, logos, etc).

- `/website`
  > Place to put the project's website data if you are not using GitHub pages.

**Service Application Directories:**

- `/api`
  > Protocol definition files.

**Web Application Directories:**

- `/web`
  > Web application specific components: static web assets, server side templates and SPAs.

**Files:**

- `go.mod`
  > Package dependency and version management.

## Python

[Python Project Layout](https://github.com/johnthagen/python-blueprint) using best practices.

**Directories:**

- `/module`

- `/docs`
  > Package reference documentation.

- `/tests`
  > Package unit tests, execution tests, integration tests.

- `/bin`
  > Holds executable files.

**Files:**

- `setup.py`
  > Package and distribution management.

- `requirements.txt`
  > Package dependency and version management.

- `Makefile`
  > Generic management tasks.
