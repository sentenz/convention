#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Setup the Software Analysis using linters.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source ./../scripts/shell/pkg.sh

# Constant Variables

readonly -A APT_PACKAGES=(
  ["shellcheck"]="0.8.0-2"
  ["shfmt"]="3.4.3-1"
)

readonly -A PIP_PACKAGES=(
  ["codespell"]="2.2.6"
  ["proselint"]="0.13.0"
  ["yamllint"]="1.35.1"
)

readonly -A NPM_PACKAGES=(
  ["alex"]="10.0.0"
  ["prettier"]="2.7.1"
  ["jsonlint"]="1.6.3"
  ["@commitlint/cli"]="17.2.0"
  ["@commitlint/config-conventional"]="17.2.0"
  ["@commitlint/format"]="17.0.0"
  ["markdownlint-cli2"]="0.12.1"
  ["markdown-link-check"]="3.12.1"
)

# Internal Functions

function setup_linter() {
  local -i retval=0

  pkg_apt_install_list APT_PACKAGES
  ((retval |= $?))

  pkg_apt_clean
  ((retval |= $?))

  pkg_pip_install_list PIP_PACKAGES
  ((retval |= $?))

  pkg_pip_clean
  ((retval |= $?))

  pkg_npm_install_list NPM_PACKAGES
  ((retval |= $?))

  pkg_npm_clean
  ((retval |= $?))

  return "${retval}"
}

# Control Flow Logic

setup_linter
exit "${?}"
