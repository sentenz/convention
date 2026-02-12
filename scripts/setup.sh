#!/bin/bash
#
# Install and configure all dependencies essential for development.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source "$(dirname "${BASH_SOURCE[0]}")/shell/pkg.sh"

# Constant Variables

readonly -A GO_PACKAGES=(
  ["go.mozilla.org/sops/cmd/sops"]="3.4.0"
)

# Control Flow Logic

function setup() {
  local -i retval=0

  pkg_go_install_list GO_PACKAGES
  ((retval |= $?))

  pkg_go_clean
  ((retval |= $?))

  return "${retval}"
}

setup
exit "${?}"
