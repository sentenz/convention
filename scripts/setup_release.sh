#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Setup of the Software Release environment.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source ./../scripts/shell/pkg.sh

# Constant Variables

readonly -A NPM_PACKAGES=(
  ["semantic-release"]="23.0.2"
  ["@semantic-release/git"]="10.0.1"
  ["@semantic-release/changelog"]="6.0.3"
  ["@semantic-release/error"]="4.0.0"
  ["@semantic-release/exec"]="6.0.3"
  ["@semantic-release/commit-analyzer"]="11.1.0"
  ["@semantic-release/release-notes-generator"]="12.1.0"
  ["conventional-changelog-conventionalcommits"]="7.0.2"
  ["@semantic-release/github"]="10.0.2"
)

# Internal Functions

function setup_release() {
  local -i retval=0

  pkg_npm_install_list NPM_PACKAGES
  ((retval |= $?))

  pkg_npm_clean
  ((retval |= $?))

  return "${retval}"
}

# Control Flow Logic

setup_release
exit "${?}"
