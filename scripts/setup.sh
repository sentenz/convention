#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Call the setup scripts.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Constant Variables

readonly -a SCRIPTS=(
  setup_release.sh
)

# Control Flow Logic

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

setup
exit "${?}"
