# See https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Display help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
.PHONY: help

setup: ## Setup dependencies and tools for the devops service
	cd tools/devops/scripts && chmod +x setup.sh && ./setup.sh
.PHONY: setup

setup-integration: ## Setup dependencies and tools for the integration service
	cd scripts/pipeline && chmod +x setup_continuous_integration.sh && ./setup_continuous_integration.sh
.PHONY: setup-integration

run-linter-staged: ## Perform validation of local staged files
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l staged
.PHONY: run-linter-staged

run-linter-diff: ## Perform validation of local modified files
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l diff
.PHONY: run-linter-diff

run-linter-ci: ## Perform validation of modified files in continuous integration pipeline
	cd tools/devops/cmd/app && chmod +x sast.sh && ./sast.sh -l ci
.PHONY: run-linter-ci

run-linter-commit: ## Perform validation of the commit message
	commitlint --edit .git/COMMIT_EDITMSG
.PHONY: run-linter-commit

run-sanitizer: ## Perform validation of binary files
	cd cmd/app && chmod +x dast.sh && ./dast.sh -b cmd/bin/*
.PHONY: run-linter-ci

setup-testing: ## Setup dependencies and tools for the testing service
	cd scripts/pipeline && chmod +x setup_continuous_testing.sh && ./setup_continuous_testing.sh
.PHONY: run-sanitizer

setup-release: ## Setup dependencies and tools for the release service
	cd scripts/pipeline && chmod +x setup_continuous_release.sh && ./setup_continuous_release.sh
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
