# SPDX-License-Identifier: Apache-2.0

ifneq (,$(wildcard .env))
	include .env
	export
endif

# Define Variables

SHELL := /bin/bash
SHELL_COMMAND = source
SHELL_FILE_CLI = $(@D)/internal/cli.sh

# Define Targets

default: help

help:
	@awk 'BEGIN {printf "TASK\n\tA centralized collection of commands and operations used in this project.\n\n"}'
	@awk 'BEGIN {printf "USAGE\n\tmake $(shell tput -Txterm setaf 6)[target]$(shell tput -Txterm sgr0)\n\n"}' $(MAKEFILE_LIST)
	@awk '/^##/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print "$(shell tput -Txterm setaf 6)\t" substr($$1,1,index($$1,":")) "$(shell tput -Txterm sgr0)",c}1{c=0}' $(MAKEFILE_LIST) | column -s: -t
.PHONY: help

## Setup the development environment
setup:
	cd $(@D)/scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup

## Setup dependencies and tools for the devops service
setup-devops:
	cd tools/devops/scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup-devops

## Teardown dependencies and tools for the devops service
teardown-devops:
	cd tools/devops/scripts && chmod +x teardown.sh && ./teardown.sh
.PHONY: teardown-devops

## Update dependencies and tools for the devops service
update-devops:
	$(MAKE) teardown-devops
	$(MAKE) setup-devops
.PHONY: update-devops

## Setup dependencies and tools for the integration service
setup-integration:
	cd $(@D)/scripts/pipeline && chmod +x setup_integration.sh && ./setup_integration.sh
.PHONY: setup-integration

## Perform analysis of local staged files
run-linter-staged:
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l staged
.PHONY: run-linter-staged

## Perform analysis of local modified files
run-linter-diff:
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l diff
.PHONY: run-linter-diff

## Perform analysis of modified files in continuous integration pipeline
run-linter-ci:
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l ci
.PHONY: run-linter-ci

## Perform analysis of the commit message
run-linter-commit:
	commitlint --edit .git/COMMIT_EDITMSG
.PHONY: run-linter-commit

## Setup dependencies and tools for the vscode devcontainer
setup-devcontainer:
	$(MAKE) setup
.PHONY: setup-devcontainer

## Setup dependencies and tools for the continuous integration pipeline
setup-continuous-integration:
	$(MAKE) setup-integration
.PHONY: setup-continuous-integration

## Perform task in continuous integration pipeline
run-continuous-integration:
	$(MAKE) run-linter-ci
.PHONY: run-continuous-integration

## Setup dependencies and tools for the continuous testing pipeline
setup-continuous-testing:
	$(MAKE) setup-testing
.PHONY: setup-continuous-testing

## Perform task in continuous testing pipeline
run-continuous-testing:
	# TODO(AK)
.PHONY: run-continuous-testing

## Setup the release environment
setup-release:
	cd $(@D)/scripts && chmod +x setup_release.sh && ./setup_release.sh
.PHONY: setup-release

## Perform the release analysis
run-release:
	npx semantic-release
.PHONY: run-release

## Workflow of the release process
workflow-release:
	$(MAKE) setup-release
	$(MAKE) release
.PHONY: pipeline-release
