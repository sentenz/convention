#!/bin/bash
#
# Perform environment setup.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../scripts/utils/util.sh

# Constant variables
readonly -a APT_PACKAGES=(
  software-properties-common
  build-essential
  git
  automake
  python3
  python-is-python3
  python3-pip
  cmake
  make
  dirmngr
  lsb-release
)

# Internal functions

setup() {
  local -i result=0

  setup_apt_packages "${APT_PACKAGES[@]}"
  ((result |= $?))

  cleanup_apt
  ((result |= $?))

  return "${result}"
}

# Control flow logic

setup
exit "${?}"
