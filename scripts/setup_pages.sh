#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Setup of the SSG Pages environment.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source ./../scripts/shell/pkg.sh

# Constant Variables

readonly -A PIP_PACKAGES=(
  ["mkdocs"]="1.6.0"
  ["mkdocs-material"]="9.5.19"
  ["mkdocs-macros-plugin"]="1.0.5"
  ["pymdown-extensions"]="10.8"
)

# Internal Functions

function setup_pages() {
  local -i retval=0

  pkg_pip_install_list PIP_PACKAGES
  ((retval |= $?))

  pkg_pip_clean
  ((retval |= $?))

  return "${retval}"
}

# Control Flow Logic

setup_pages
exit "${?}"
