# SPDX-License-Identifier: Apache-2.0

# Load Dotenv Files

DOTENV_FILES := $(filter-out %.enc,$(wildcard .env .env.*))
ifneq ($(strip $(DOTENV_FILES)),)
	include $(DOTENV_FILES)
	export
endif

# Define Variables

PIP_VENV := .venv/bin

SHELL := bash
.SHELLFLAGS := -euo pipefail -c
.ONESHELL:

# ─── General ─────────────────────────────────────────────────────────────────────────────────────

default: help

# NOTE Targets MUST have a leading comment line starting with `##` to be included in the list. See the targets below for examples.
#
## Display help message with a list of available tasks
help:
	@awk 'BEGIN {printf "Tasks\n\tA collection of tasks used in the current project.\n\n"}'
	@awk 'BEGIN {printf "Usage\n\tmake $(shell tput -Txterm setaf 6)<task>$(shell tput -Txterm sgr0)\n\n"}' $(MAKEFILE_LIST)
	@awk '/^##/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print "$(shell tput -Txterm setaf 6)\t" substr($$1,1,index($$1,":")) "$(shell tput -Txterm sgr0)",c}1{c=0}' $(MAKEFILE_LIST) | column -s: -t
.PHONY: help

# ─── Setup & Teardown ────────────────────────────────────────────────────────────────────────────

## Initialize a software development workspace with requisites
bootstrap:
	@cd ./scripts/ && bash ./bootstrap.sh
.PHONY: bootstrap

## Install and configure all dependencies essential for development
setup:
	@cd ./scripts/ && bash ./setup.sh
.PHONY: setup

## Remove development artifacts and restore the host to its pre-setup state
teardown:
	@cd ./scripts/ && bash ./teardown.sh
.PHONY: teardown

# ─── Git Hooks Manager ───────────────────────────────────────────────────────────────────────────

## Initialize Lefthook Git hooks in the local repository
githooks-lefthook-initialize:
	lefthook install --force
.PHONY: githooks-lefthook-initialize

## Deinitialize Lefthook Git hooks from the local repository
githooks-lefthook-deinitialize:
	lefthook uninstall
.PHONY: githooks-lefthook-deinitialize

# ─── Skills Manager ──────────────────────────────────────────────────────────────────────────────

## Provision new Agent Skills into the project environment
skills-agent-add:
	skills add sentenz/skills
.PHONY: skills-agent-add

## Synchronize and update existing Agent Skills in the project environment
skills-agent-update:
	skills update sentenz/skills
.PHONY: skills-agent-update

# ─── Dependency Manager ──────────────────────────────────────────────────────────────────────────

DEPENDENCY_IMAGE_RENOVATE ?= docker.io/renovate/renovate:43.288.0@sha256:3b72fc4274c56f65f53dcd4dcbed3143289358e0a2d96f7af215e6cf1923e5f6

## Update project dependencies locally using Renovate and generate a report
dependency-renovate-update:
	@mkdir -p logs/dependency

	docker run --rm -v "${PWD}:/workspace" -w /workspace -e LOG_LEVEL=debug -e RENOVATE_REPOSITORIES -e RENOVATE_TOKEN=$(RENOVATE_TOKEN) "$(DEPENDENCY_IMAGE_RENOVATE)" renovate --platform=local --repository-cache=reset > logs/dependency/renovate.log 2>&1
.PHONY: dependency-renovate-update

# ─── Secrets Manager ─────────────────────────────────────────────────────────────────────────────

SECRETS_IMAGE_SOPS ?= ghcr.io/getsops/sops:v3.13.3@sha256:857f5a151ac0b2bfc55c1e4e5581d66fb8e268e4d106b38e74191f3bac9d58ea
SECRETS_SOPS_UID ?= sops-convention

# Usage: make secrets-gpg-generate SECRETS_SOPS_UID=<uid>
#
## Generate a new GPG key pair for SOPS with the specified UID
secrets-gpg-generate:
	@gpg --batch --quiet --passphrase '' --quick-generate-key "$(SECRETS_SOPS_UID)" ed25519 cert,sign 0
	@NEW_FPR="$$(gpg --list-keys --with-colons "$(SECRETS_SOPS_UID)" | awk -F: '/^fpr:/ {print $$10; exit}')"
	@gpg --batch --quiet --passphrase '' --quick-add-key "$${NEW_FPR}" cv25519 encrypt 0
.PHONY: secrets-gpg-generate

# Usage: make secrets-gpg-export SECRETS_SOPS_UID=<uid>
#
## Export the GPG key pair for SOPS with the specified UID to ASCII files
secrets-gpg-export:
	@if [ -z "$(SECRETS_SOPS_UID)" ]; then \
		echo "usage: make secrets-gpg-export SECRETS_SOPS_UID=<uid>" >&2; \
		exit 1; \
	fi

	@gpg --armor --export "$(SECRETS_SOPS_UID)" > "$(SECRETS_SOPS_UID)-public.asc"
	@gpg --armor --export-secret-keys "$(SECRETS_SOPS_UID)" > "$(SECRETS_SOPS_UID)-private.asc"
.PHONY: secrets-gpg-export

# Usage: make secrets-gpg-import [SECRETS_SOPS_UID=<uid>] <key-files>
#
## Import GPG keys from specified files and if provided set ultimate trust for the SOPS UID
secrets-gpg-import:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make secrets-gpg-import <files>" >&2; \
		exit 1; \
	fi

	# Import keys from specified files
	@for file in $(filter-out $@,$(MAKECMDGOALS)); do \
		if [ -f "$$file" ]; then \
			gpg --import "$$file"; \
		fi; \
	done

	# Set ultimate trust for the SECRETS_SOPS_UID
	@if [ "$(origin SECRETS_SOPS_UID)" = "command line" ] && [ -n "$(SECRETS_SOPS_UID)" ]; then \
		FPR="$$( { gpg --list-keys --with-colons "$(SECRETS_SOPS_UID)" 2>/dev/null || true; } | awk -F: '/^fpr:/ {print $$10; exit}')"; \
		if [ -n "$${FPR}" ]; then \
			echo "$${FPR}:6:" | gpg --import-ownertrust; \
		fi; \
	fi
.PHONY: secrets-gpg-import

# Usage: make secrets-gpg-remove SECRETS_SOPS_UID=<uid>
#
## Remove GPG keys for SOPS with the specified UID (interactive)
secrets-gpg-remove:
	@if ! gpg --list-keys "$(SECRETS_SOPS_UID)" >/dev/null 2>&1; then
		echo "warning: no key found for '$(SECRETS_SOPS_UID)'" >&2
		exit 0
	fi

	# Delete private key first, then public key
	@gpg --yes --delete-secret-keys "$(SECRETS_SOPS_UID)"
	@gpg --yes --delete-keys "$(SECRETS_SOPS_UID)"
.PHONY: secrets-gpg-remove

# Usage: make secrets-gpg-show [SECRETS_SOPS_UID=<uid>]
#
## Show GPG public key information for SOPS UID or list all keys if UID is not set
secrets-gpg-show:
	@if [ "$(origin SECRETS_SOPS_UID)" != "command line" ]; then \
		gpg --list-keys --keyid-format long; \
		exit 0; \
	fi

	@FPR="$$( { gpg --list-keys --with-colons "$(SECRETS_SOPS_UID)" 2>/dev/null || true; } | awk -F: '/^fpr:/ {print $$10; exit}')"; \
	if [ -z "$${FPR}" ]; then \
		echo "error: no fingerprint found for UID '$(SECRETS_SOPS_UID)'" >&2; \
		exit 1; \
	fi; \
	echo -e "UID: $(SECRETS_SOPS_UID)\nFingerprint: $${FPR}"
.PHONY: secrets-gpg-show

# Usage: make secrets-sops-encrypt <files>
#
## Encrypt specified files using SOPS with GPG keys, writing output to <file>.enc
secrets-sops-encrypt:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make secrets-sops-encrypt <files>" >&2; \
		exit 1; \
	fi

	@for file in $(filter-out $@,$(MAKECMDGOALS)); do \
		if [ -f "$$file" ]; then \
			docker run --rm -v "${PWD}:/workspace" -v "$${HOME}/.gnupg:/root/.gnupg" -w /workspace $(SECRETS_IMAGE_SOPS) encrypt --output "$$file.enc" "$$file"; \
		else \
			echo "file not found: $$file" >&2; \
		fi; \
	done
.PHONY: secrets-sops-encrypt

# Usage: make secrets-sops-decrypt <files>
#
## Decrypt specified SOPS-encrypted files (expects <file>.enc), writing output to <file>
secrets-sops-decrypt:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make secrets-sops-decrypt <files>" >&2; \
		exit 1; \
	fi

	@for file in $(filter-out $@,$(MAKECMDGOALS)); do \
		case "$$file" in \
			*.enc) \
				docker run --rm -v "${PWD}:/workspace" -v "$${HOME}/.gnupg:/root/.gnupg" -w /workspace $(SECRETS_IMAGE_SOPS) decrypt --filename-override "$${file%.enc}" --output "$${file%.enc}" "$$file"; \
				;; \
			*) \
				docker run --rm -v "${PWD}:/workspace" -v "$${HOME}/.gnupg:/root/.gnupg" -w /workspace $(SECRETS_IMAGE_SOPS) decrypt --in-place "$$file"; \
				;; \
		esac; \
	done
.PHONY: secrets-sops-decrypt

# Usage: make secrets-sops-view <file>
#
## View decrypted contents of a SOPS-encrypted file using GPG keys
secrets-sops-view:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make secrets-sops-view <file>" >&2; \
		exit 1; \
	fi

	docker run --rm -v "${PWD}:/workspace" -v "$${HOME}/.gnupg:/root/.gnupg" -w /workspace $(SECRETS_IMAGE_SOPS) decrypt "$(filter-out $@,$(MAKECMDGOALS))"
.PHONY: secrets-sops-view

# ─── Policy Manager ──────────────────────────────────────────────────────────────────────────────

POLICY_IMAGE_CONFTEST ?= docker.io/openpolicyagent/conftest:v0.69.0@sha256:a38ba21668929a00dce2fe6ee43d1312228340bce5fd243f47dd0ce90516e558

# Usage: make policy-conftest-test <filepath>
#
## Run Conftest container in REPL (Read-Eval-Print-Loop) to evaluate policies against input data and generate a report
policy-conftest-test:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make policy-conftest-test <filepath>"; \
		exit 1; \
	fi

	@mkdir -p logs/policy

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(POLICY_IMAGE_CONFTEST)" test "$(filter-out $@,$(MAKECMDGOALS))" > logs/policy/conftest-report.json 2>&1
.PHONY: policy-conftest-test

POLICY_IMAGE_REGAL ?= ghcr.io/open-policy-agent/regal:0.42.0@sha256:07984036043f772a1f921bd0ad9045b8bd9dc58460a1d76f476c458dc8a98b16

# Usage: make policy-regal-lint <filepath>
#
## Lint Rego policies using Regal and generate a report
policy-regal-lint:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make policy-regal-lint <filepath>"; \
		exit 1; \
	fi

	@mkdir -p logs/policy

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(POLICY_IMAGE_REGAL)" lint "$(filter-out $@,$(MAKECMDGOALS))" --format json > logs/policy/regal.json 2>&1
.PHONY: policy-regal-lint

# ─── Static Analysis ─────────────────────────────────────────────────────────────────────────────

LINT_IMAGE_MARKDOWNLINT ?= davidanson/markdownlint-cli2:0.22.1@sha256:0ed9a5f4c77ef447da2a2ac6e67caf74b214a7f80288819565e8b7d2ac148fe5
LINT_FILES_MARKDOWNLINT ?= "**/*.md"

## Lint Markdown files using markdownlint and generate a report
lint-markdown:
	@mkdir -p logs/lint

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(LINT_IMAGE_MARKDOWNLINT)" $(LINT_FILES_MARKDOWNLINT) > logs/lint/markdownlint 2>&1
.PHONY: lint-markdown

# ─── SAST Manager ────────────────────────────────────────────────────────────────────────────────

SAST_IMAGE_SEMGREP ?= semgrep/semgrep:1.173.0@sha256:67319956da3dcb58baf5b322899c15458e3963e7018a86aeeb5cd224e69cb77a
SAST_FILES_SEMGREP ?= .
SAST_REGEX_SEMGREP = $(if $(strip $(SAST_FILES_SEMGREP)),$(SAST_FILES_SEMGREP),.)

## Scan source code for security issues using Semgrep and generate a report
sast-semgrep-scan:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_SEMGREP)" semgrep scan --config auto --error --json --output logs/sast/semgrep.json $(SAST_REGEX_SEMGREP) 2> logs/sast/semgrep.log
.PHONY: sast-semgrep-scan

SAST_IMAGE_TRIVY ?= aquasec/trivy:0.74.0@sha256:62b1e65e8869bc4b4c6aa4fa2b21595256c7c2f6018a9d9ad61caf87187c1969
SAST_FILES_TRIVY ?= .

## Scan Infrastructure-as-Code (IaC) files for misconfigurations using Trivy and generate a report
sast-trivy-misconfig:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" config --output logs/sast/trivy-misconfig.json $(SAST_FILES_TRIVY) 2>&1
.PHONY: sast-trivy-misconfig

## Scan local filesystem for vulnerabilities and misconfigurations using Trivy
sast-trivy-fs:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" filesystem --output logs/sast/trivy-filesystem.json /workspace 2>&1
.PHONY: sast-trivy-fs

# Usage: make sast-trivy-image <image_name>
#
## Scan a container image for vulnerabilities using Trivy
sast-trivy-image:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-image <image_name>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" image --output logs/sast/trivy-image.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-image

# Usage: make sast-trivy-image-license <image_name>
#
## Scan a container image for license compliance using Trivy
sast-trivy-image-license:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-image-license <image_name>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" image --scanners license --format table --output logs/sast/trivy-image-license.txt "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-image-license

# Usage: make sast-trivy-repository <repo_url>
#
## Scan a remote repository for vulnerabilities using Trivy
sast-trivy-repository:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-repository <repo_url>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" repository --output logs/sast/trivy-repository.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-repository

# Usage: make sast-trivy-rootfs <path>
#
## Scan a rootfs e.g. `/` for vulnerabilities using Trivy
sast-trivy-rootfs:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-rootfs <path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" rootfs --output logs/sast/trivy-rootfs.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-rootfs

# Usage: make sast-trivy-sbom-scan <sbom_path>
#
## Scan SBOM for vulnerabilities using Trivy
sast-trivy-sbom-scan:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-sbom-scan <sbom_path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" sbom --output logs/sast/trivy-sbom.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-sbom-scan

# Usage: make sast-trivy-sbom-cyclonedx-image <image_name>
#
## Generate SBOM in CycloneDX format for a container image using Trivy
sast-trivy-sbom-cyclonedx-image:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-sbom-cyclonedx-image <image_name>"; \
		exit 1; \
	fi

	@mkdir -p logs/sbom

	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" image --format cyclonedx --output logs/sbom/sbom-image.cdx.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-sbom-cyclonedx-image

# Usage: make sast-trivy-sbom-cyclonedx-fs <path>
#
## Generate SBOM in CycloneDX format for a file system using Trivy
sast-trivy-sbom-cyclonedx-fs:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-sbom-cyclonedx-fs <path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sbom

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" filesystem --format cyclonedx --output logs/sbom/sbom-fs.cdx.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-sbom-cyclonedx-fs

# Usage: make sast-trivy-sbom-license <sbom_path>
#
## Scan SBOM for license compliance using Trivy
sast-trivy-sbom-license:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-sbom-license <sbom_path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" sbom --scanners license --format table --output logs/sast/trivy-sbom-license.txt "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-sbom-license

# Usage: make sast-trivy-sbom-attestation <intoto_sbom_path>
#
## Scan the verified SBOM attestation using Trivy
sast-trivy-sbom-attestation:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-sbom-attestation <intoto_sbom_path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" sbom "$(filter-out $@,$(MAKECMDGOALS))"
.PHONY: sast-trivy-sbom-attestation

# Usage: make sast-trivy-vm <vm_image_path>
#
## [EXPERIMENTAL] Scan a virtual machine image using Trivy
sast-trivy-vm:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-trivy-vm <vm_image_path>"; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" vm --output logs/sast/trivy-vm.json "$(filter-out $@,$(MAKECMDGOALS))" 2>&1
.PHONY: sast-trivy-vm

# Usage: make sast-trivy-kubernetes [target]
#
## [EXPERIMENTAL] Scan kubernetes cluster using Trivy (default `cluster`)
sast-trivy-kubernetes:
	@echo "Note: This requires KUBECONFIG to be mounted or available to the container. Assuming ~/.kube/config is mounted to /root/.kube/config"

	@mkdir -p logs/sast

	docker run --rm -v "${HOME}/.kube/config:/root/.kube/config" -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRIVY)" kubernetes --output logs/sast/trivy-kubernetes.json $(if $(filter-out $@,$(MAKECMDGOALS)),$(filter-out $@,$(MAKECMDGOALS)),cluster) 2>&1
.PHONY: sast-trivy-kubernetes

SAST_IMAGE_GITLEAKS ?= ghcr.io/gitleaks/gitleaks:v8.30.1@sha256:c00b6bd0aeb3071cbcb79009cb16a60dd9e0a7c60e2be9ab65d25e6bc8abbb7f

## Scan git repository history for leaked secrets using Gitleaks and generate a report
sast-gitleaks-detect:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_GITLEAKS)" detect --redact --source /workspace --report-format json --report-path logs/sast/gitleaks-detect.json 2>&1
.PHONY: sast-gitleaks-detect

## Scan staged git changes for leaked secrets using Gitleaks and generate a report
sast-gitleaks-staged:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_GITLEAKS)" protect --redact --staged --source /workspace --report-format json --report-path logs/sast/gitleaks-protect.json 2>&1
.PHONY: sast-gitleaks-staged

SAST_IMAGE_TRUFFLEHOG ?= trufflesecurity/trufflehog:3.97.0@sha256:ff4c95e9df7d645daf2140e3ca1039031c63106268d5fbb25feb43ceca1bcc33

## Scan local filesystem for leaked secrets using TruffleHog and generate a report
sast-trufflehog-fs:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRUFFLEHOG)" filesystem . --no-update --json > logs/sast/trufflehog-filesystem.json 2> logs/sast/trufflehog-filesystem.log
.PHONY: sast-trufflehog-fs

## Scan git repository history for leaked secrets using TruffleHog and generate a report
sast-trufflehog-git:
	@mkdir -p logs/sast

	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_TRUFFLEHOG)" git file:///workspace --no-update --json > logs/sast/trufflehog-git.json 2> logs/sast/trufflehog-git.log
.PHONY: sast-trufflehog-git

# ─── Supply Chain Security ───────────────────────────────────────────────────────────────────────

SAST_IMAGE_COSIGN ?= cgr.dev/chainguard/cosign:3.0.0@sha256:b6bc266358e9368be1b3d01fca889b78d5ad5a47832986e14640c34a237ef638

## Generate Cosign key pair
sast-cosign-generate-key-pair:
	docker run --rm -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_COSIGN)" generate-key-pair
.PHONY: sast-cosign-generate-key-pair

# Usage: make sast-cosign-attest <image_name>
#
## Attest an image with the generated SBOM using Cosign
sast-cosign-attest:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-cosign-attest <image_name>"; \
		exit 1; \
	fi
	@if [ ! -f cosign.key ]; then \
		echo "Error: cosign.key not found. Run 'make sast-cosign-generate-key-pair' first."; \
		exit 1; \
	fi
	@if [ ! -f logs/sbom/sbom.cdx.json ]; then \
		echo "Error: logs/sbom/sbom.cdx.json not found. Run 'make sast-trivy-sbom-cyclonedx <image_name>' first."; \
		exit 1; \
	fi

	docker run --rm -v "${HOME}/.docker/config.json:/root/.docker/config.json" -v "${PWD}:/workspace" -w /workspace -e COSIGN_PASSWORD "$(SAST_IMAGE_COSIGN)" attest --key cosign.key --type cyclonedx --predicate logs/sbom/sbom.cdx.json "$(filter-out $@,$(MAKECMDGOALS))"
.PHONY: sast-cosign-attest

# Usage: make sast-cosign-verify <image_name>
#
## Verify SBOM attestation for an image using Cosign
sast-cosign-verify:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "usage: make sast-cosign-verify <image_name>"; \
		exit 1; \
	fi
	@if [ ! -f cosign.pub ]; then \
		echo "Error: cosign.pub not found. Run 'make sast-cosign-generate-key-pair' first."; \
		exit 1; \
	fi

	@mkdir -p logs/sast

	docker run --rm -v "${HOME}/.docker/config.json:/root/.docker/config.json" -v "${PWD}:/workspace" -w /workspace "$(SAST_IMAGE_COSIGN)" verify-attestation --key cosign.pub --type cyclonedx "$(filter-out $@,$(MAKECMDGOALS))" > logs/sbom/sbom.cdx.intoto.jsonl 2> logs/sast/cosign-verify.log
.PHONY: sast-cosign-verify

# ─── Static Site Generator (SSG) ─────────────────────────────────────────────────────────────────

### Setup documentation pages with MkDocs
pages-mkdocs-setup:
	@python3 -m venv .venv && . $(PIP_VENV)/activate && cd ./scripts/ && bash ./setup_pages.sh
.PHONY: pages-mkdocs-setup

## Build documentation pages with MkDocs
pages-mkdocs-build:
	@. $(PIP_VENV)/activate; mkdocs build
.PHONY: pages-mkdocs-build

## Serve documentation pages locally with MkDocs
pages-mkdocs-serve:
	@. $(PIP_VENV)/activate; mkdocs serve --dev-addr 127.0.0.1:8000 --livereload
.PHONY: pages-mkdocs-serve

# ─── Documentation Generators ────────────────────────────────────────────────────────────────────

## Build content using Static Site Generator (SSG) for Doxygen documentation
pages-doxygen-build:
	@doxygen Doxyfile
.PHONY: pages-doxygen-build

## Serve the build Static Site Generator (SSG) for Doxygen documentation on a local web server
pages-doxygen-serve:
	@OUT="$$(awk -F'= *' '/^OUTPUT_DIRECTORY/ {gsub(/^[ \t]+|[ \t]+$$/,"",$$2); print $$2; exit}' Doxyfile 2>/dev/null)"; \
	HTML="$$(awk -F'= *' '/^HTML_OUTPUT/ {gsub(/^[ \t]+|[ \t]+$$/,"",$$2); print $$2; exit}' Doxyfile 2>/dev/null)"; \
	OUTDIR="$${OUT:+$${OUT}/}$${HTML:-html}"; \
	if [ ! -d "$$OUTDIR" ]; then echo "error: generated docs not found in $$OUTDIR; run 'make pages-doxygen-build' first" >&2; exit 1; fi; \
	echo "Serving $$OUTDIR at http://localhost:8000"; \
	python3 -m http.server --directory "$$OUTDIR" 8000
.PHONY: pages-doxygen-serve
