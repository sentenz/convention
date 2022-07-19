
# Usage
# See https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: usage

usage: ## Display usage screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

install-continuous-release: ## Run scripts to setup tooling for continuous release pipeline
	cd scripts && chmod +x continuous_release.sh && ./continuous_release.sh
.PHONY: install-continuous-release

run-continuous-release: ## Perform task in continuous release pipeline
	npx semantic-release
.PHONY: run-continuous-release
