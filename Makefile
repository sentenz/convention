# SPDX-License-Identifier: Apache-2.0

ifneq (,$(wildcard .env))
	include .env
	export
endif

# Define Variables

SHELL := /bin/bash
SHELL_COMMAND = source
SHELL_FILE_CLI = $(@D)/scripts/shell/cli.sh

# Define Targets

default: help

help:
	@awk 'BEGIN {printf "TASK\n\tA centralized collection of commands and operations used in this project.\n\n"}'
	@awk 'BEGIN {printf "USAGE\n\tmake $(shell tput -Txterm setaf 6)[target]$(shell tput -Txterm sgr0)\n\n"}'
	@awk 'BEGIN {printf "TARGET\n"}'
	@awk '/^##/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print "$(shell tput -Txterm setaf 6)\t" substr($$1,1,index($$1,":")) "$(shell tput -Txterm sgr0)",c}1{c=0}' $(MAKEFILE_LIST) | column -s: -t
.PHONY: help

## Setup of the Software Development environment
setup:
	cd $(@D)/scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup

## Setup dependencies and tools for the integration service
setup-linter:
	cd $(@D)/scripts && chmod +x setup_linter.sh && ./setup_linter.sh
.PHONY: setup-linter

## Setup of the Software Release environment
setup-release:
	cd $(@D)/scripts && chmod +x setup_release.sh && ./setup_release.sh
.PHONY: setup-release

## Perform the Software Release analysis
release:
	$(SHELL_COMMAND) $(SHELL_FILE_CLI) && cli_semantic_release
.PHONY: release

## Setup of the SSG Pages environment
setup-pages:
	cd $(@D)/scripts && chmod +x setup_pages.sh && ./setup_pages.sh
.PHONY: setup-pages

## Perform the SSG Pages build
pages:
	$(SHELL_COMMAND) $(SHELL_FILE_CLI) && cli_gitbook build
.PHONY: pages

## Workflow of the Software Release process
workflow-release:
	$(MAKE) setup-release
	$(MAKE) release
.PHONY: workflow-release

## Workflow of the SSG Pages process
workflow-pages:
	$(MAKE) setup-pages
	$(MAKE) pages
.PHONY: workflow-pages
