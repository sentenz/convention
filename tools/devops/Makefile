ifneq (,$(wildcard ./.env))
	include .env
	export
endif

# See https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Display help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
.PHONY: help

setup: ## Setup dependencies and tools
	cd $(@D)/scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup

setup-devops: ## Setup dependencies and tools for the devops service
	cd scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup-devops

teardown-devops: ## Teardown dependencies and tools for the devops service
	cd scripts && chmod +x teardown.sh && ./teardown.sh
.PHONY: teardown-devops

update-devops: ## Update dependencies and tools for the devops service
	$(MAKE) teardown-devops
	$(MAKE) setup-devops
.PHONY: update-devops

setup-integration: ## Setup dependencies and tools for the integration service
	cd $(@D)/scripts/pipeline && chmod +x setup_integration.sh && ./setup_integration.sh
.PHONY: setup-integration

run-linter-staged: ## Perform analysis of local staged files
	cd cmd/app && chmod +x sast.sh && ./sast.sh -l staged
.PHONY: run-linter-staged

run-linter-diff: ## Perform analysis of local modified files
	cd cmd/app && chmod +x sast.sh && ./sast.sh -l diff
.PHONY: run-linter-diff

run-linter-ci: ## Perform analysis of modified files in continuous integration pipeline
	cd cmd/app && chmod +x sast.sh && ./sast.sh -l ci
.PHONY: run-linter-ci

run-linter-commit: ## Perform analysis of the commit message
	commitlint --edit .git/COMMIT_EDITMSG
.PHONY: run-linter-commit

run-sanitizer-app: ## Perform analysis of the application binary file
	cd cmd/app && chmod +x dast.sh && ./dast.sh -b cmd/bin/*-app
.PHONY: run-sanitizer-app

run-sanitizer-test: ## Perform analysis of the test binary file
	cd cmd/app && chmod +x dast.sh && ./dast.sh -b cmd/bin/*-test
.PHONY: run-sanitizer-test

setup-testing: ## Setup dependencies and tools for the testing service
	cd $(@D)/scripts/pipeline && chmod +x setup_integration.sh && ./setup_integration.sh
.PHONY: setup-testing

setup-release: ## Setup dependencies and tools for the release service
	cd $(@D)/scripts/pipeline && chmod +x setup_release.sh && ./setup_release.sh
.PHONY: setup-release

run-release: ## Perform release service task
	npx semantic-release
.PHONY: run-release

setup-devcontainer: ## Setup dependencies and tools for the vscode devcontainer
	$(MAKE) setup
.PHONY: setup-devcontainer

setup-continuous-integration: ## Setup dependencies and tools for the continuous integration pipeline
	$(MAKE) setup-integration
.PHONY: setup-continuous-integration

run-continuous-integration: ## Perform task in continuous integration pipeline
	$(MAKE) run-linter-ci
.PHONY: run-continuous-integration

setup-continuous-testing: ## Setup dependencies and tools for the continuous testing pipeline
	$(MAKE) setup-testing
.PHONY: setup-continuous-testing

run-continuous-testing: ## Perform task in continuous testing pipeline
	# TODO(AK)
.PHONY: run-continuous-testing

setup-continuous-release: ## Setup dependencies and tools for the continuous release pipeline
	$(MAKE) setup-release
.PHONY: setup-continuous-release

run-continuous-release: ## Perform task in continuous release pipeline
	$(MAKE) run-release
.PHONY: run-continuous-release

install-extensions: ## Install recommended VS Code extensions
	code --list-extensions | xargs -L 1 code --install-extension
.PHONY: install-extensions
