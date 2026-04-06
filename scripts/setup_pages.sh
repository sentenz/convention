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

source "$(dirname "${BASH_SOURCE[0]}")/shell/pkg.sh"

# Constant Variables

readonly -A PIP_PACKAGES=(
  ["mkdocs"]="1.6.1"
  ["mkdocs-material"]="9.7.1"
  ["mkdocs-macros-plugin"]="1.0.5"
  ["markdown-it-py"]="3.0.0"
  ["pymdown-extensions"]="10.21.2"
  ["pygments"]="2.20.0"
  ["mkdocs-awesome-nav"]="3.3.0"
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
