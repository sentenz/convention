#!/bin/bash
#
# Perform dependency setup for continuous testing pipeline.

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
  golang-go
)

# Internal functions

setup_continuous_testing() {
  local -i result=0

  setup_apt_packages "${APT_PACKAGES[@]}"
  ((result |= $?))

  cleanup_apt
  ((result |= $?))

  return "${result}"
}

# Control flow logic

setup_continuous_testing
exit "${?}"
