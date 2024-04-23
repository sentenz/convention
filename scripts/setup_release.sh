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
readonly -A NPM_PACKAGES=(
  ["semantic-release"]="17.4.7"
  ["semantic-commitlint"]="1.4.0"
  ["semantic-release-commitlint"]="1.2.2"
  ["@semantic-release/git"]="10.0.1"
  ["@semantic-release/changelog"]="6.0.2"
  ["@semantic-release/error"]="3.0.0"
  ["@semantic-release/exec"]="6.0.3"
  ["@semantic-release/commit-analyzer"]="9.0.2"
  ["@semantic-release/release-notes-generator"]="10.0.3"
  ["@semantic-release/github"]="8.0.7"
  # ["semantic-release-ado"]="1.4.0"
  # ["@semantic-release/npm"]="latest"
)

# Internal functions

setup_release() {
  local -i retval=0
  local -i result=0

  util_install_apt_packages "${APT_PACKAGES[@]}"
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

  return "${result}"
}

# Control flow logic

setup_release
exit "${?}"
