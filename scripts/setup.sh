#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Perform the setup scripts.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Constant Variables

readonly -A SCRIPTS=(
  setup_linter.sh
)

# Internal Functions

function setup() {
  local -i retval=0
  local -i result=0

  for script in "${SCRIPTS[@]}"; do
    chmod +x "${script}"
    ./"${script}"
    ((result = $?))
    ((retval |= "${result}"))
  done

  return "${retval}"
}

# Control Flow Logic

setup
exit "${?}"
