#!/bin/bash
#
# Perform dependency setup for continuous release pipeline.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/util.sh

# Constant variables

readonly -a APT_PACKAGES=(
  nodejs
  npm
)
readonly -a NPM_PACKAGES=(
  semantic-release
  semantic-commitlint
  semantic-release-commitlint
  @semantic-release/git
  @semantic-release/changelog
  @semantic-release/error
  @semantic-release/exec
  @semantic-release/commit-analyzer
  @semantic-release/release-notes-generator
  @semantic-release/github
  semantic-release-ado
  # @semantic-release/npm
)

# Internal functions

setup_continuous_release() {
  local -i result=0

  setup_apt_packages "${APT_PACKAGES[@]}"
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

setup_continuous_release
exit "${?}"
