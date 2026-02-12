#!/bin/bash
#
# Initialize a software development workspace with requisites.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source "$(dirname "${BASH_SOURCE[0]}")/shell/pkg.sh"

# Constant Variables

readonly -A APT_PACKAGES=(
  ["make"]=""
  ["git"]=""
  ["jq"]=""
  ["bash"]=""
  ["ca-certificates"]=""
)

readonly -A NPM_PACKAGES=(
  ["skills"]="1.3.7"
)
# Control Flow Logic

function bootstrap() {
  local -i retval=0

  pkg_apt_install_list APT_PACKAGES
  ((retval |= $?))

  pkg_apt_clean
  ((retval |= $?))

  pkg_npm_install_list NPM_PACKAGES
  ((retval |= $?))

  pkg_npm_clean
  ((retval |= $?))

  return "${retval}"
}

bootstrap
exit "${?}"
