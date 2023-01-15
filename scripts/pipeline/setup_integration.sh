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
readonly -A NPM_PACKAGES=(
  ["alex"]="10.0.0"
  ["prettier"]="2.7.1"
  ["jsonlint"]="1.6.3"
  ["@commitlint/cli"]="17.2.0"
  ["@commitlint/config-conventional"]="17.2.0"
  ["@commitlint/format"]="17.0.0"
  ["markdownlint"]="0.27.2"
  ["markdown-link-check"]="3.10.3"
  ["write-good"]="1.0.8"
  ["remark"]="14.0.2"
  ["remark-preset-lint-markdown-style-guide"]="5.1.2"
  ["remark-preset-lint-recommended"]="6.1.2"
  ["remark-preset-lint-consistent"]="5.1.1"
)
readonly -a GO_PACKAGES=(
  github.com/golangci/golangci-lint/cmd/golangci-lint@latest
)
readonly -a CURL_PACKAGES=(
  "https://webinstall.dev/shfmt"
)

# Internal functions

setup_integration() {
  local -i retval=0
  local -i result=0

  util_install_apt_packages "${APT_PACKAGES[@]}"
  ((retval |= $?))

  util_install_go_packages "${GO_PACKAGES[@]}"
  ((retval |= $?))

  util_install_curl_packages "${CURL_PACKAGES[@]}"
  ((retval |= $?))

  util_install_pip_packages "${PIP_PACKAGES[@]}"
  ((retval |= $?))

  # HACK(AK) I don't know how to pass key value pairs to function
  # util_install_npm_packages "${NPM_PACKAGES[@]}"
  # ((result |= $?))
  for package in "${!NPM_PACKAGES[@]}"; do

    util_install_npm "${package}" "${NPM_PACKAGES[$package]}"
    ((result = $?))
    ((retval |= "${result}"))

    log_message "setup" "${package} : ${NPM_PACKAGES[$package]}" "${result}"
  done

  util_cleanup_apt
  ((retval |= $?))

  util_cleanup_npm
  ((retval |= $?))

  return "${retval}"
}

# Control flow logic

setup_integration
exit "${?}"
