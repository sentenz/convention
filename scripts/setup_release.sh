#!/bin/bash
#
# Perform dependency setup for continuous release pipeline.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../scripts/utils/util.sh

# Constant variables

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

# Internal functions

setup_release() {
  local -i retval=0
  local -i result=0

  # HACK(AK) I don't know how to pass key value pairs to function
  # util_install_npm_packages "${NPM_PACKAGES[@]}"
  # ((result |= $?))
  for package in "${!NPM_PACKAGES[@]}"; do

    util_install_npm "${package}" "${NPM_PACKAGES[$package]}"
    ((result = $?))
    ((retval |= "${result}"))

    log_message "setup" "${package} : ${NPM_PACKAGES[$package]}" "${result}"
  done

  util_cleanup_npm
  ((retval |= $?))

  return "${result}"
}

# Control flow logic

setup_release
exit "${?}"
