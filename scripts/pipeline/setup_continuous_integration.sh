#!/bin/bash
#
# Perform dependency setup for continuous integration pipeline.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/util.sh

# Constant variables

readonly -a APT_PACKAGES=(
  software-properties-common
  build-essential
  git
  automake
  python3
  python-is-python3
  python3-pip
  make
  curl
  nodejs
  npm
  golang-go

  licensecheck
  shellcheck
  cppcheck
  clang-tools
  clang-tidy
  clang-format
  valgrind
)
readonly -a PIP_PACKAGES=(
  scan-build
  codespell
  cpplint
  cmake_format
  yamllint
  proselint
)
readonly -a NPM_PACKAGES=(
  alex
  prettier
  jsonlint
  @commitlint/cli
  @commitlint/config-conventional
  @commitlint/format
  markdownlint
  markdownlint-cli
  markdown-link-check
  remark
  remark-preset-lint-markdown-style-guide
  remark-preset-lint-recommended
  remark-preset-lint-consistent
  write-good
)
readonly -a GO_PACKAGES=(
  github.com/golangci/golangci-lint/cmd/golangci-lint@latest
)
readonly -a CURL_PACKAGES=(
  "https://webinstall.dev/shfmt"
)

# Internal functions

setup_continuous_integration() {
  local -i result=0

  setup_apt_packages "${APT_PACKAGES[@]}"
  ((result |= $?))

  setup_go_packages "${GO_PACKAGES[@]}"
  ((result |= $?))

  setup_curl_packages "${CURL_PACKAGES[@]}"
  ((result |= $?))

  setup_pip_packages "${PIP_PACKAGES[@]}"
  ((result |= $?))

  setup_npm_packages "${NPM_PACKAGES[@]}"
  ((result |= $?))

  cleanup_apt
  ((result |= $?))

  cleanup_npm
  ((result |= $?))

  return "${result}"
}

# Control flow logic

setup_continuous_integration
exit "${?}"
