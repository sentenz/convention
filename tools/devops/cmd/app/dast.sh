#!/bin/bash
#
# Perform dynamic application security testing (DAST).

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/fs.sh
. ./../../scripts/utils/git.sh

# Options

F_BINARY="NULL"
while getopts 'b:' flag; do
  case "${flag}" in
    b) F_BINARY="${OPTARG}" ;;
    *) ;;
  esac
done
readonly F_BINARY

# Internal functions

sanitizer() {
  local f_binary="${1:?binary is missing}"

  (
    local -i result=0

    cd "$(fs_get_sript_dir)/../../internal/app" || return "${STATUS_ERROR}"

    chmod +x sanitizer.sh
    ./sanitizer.sh -b "${f_binary}"
    ((result |= $?))

    return "${result}"
  )
}

run_dast() {
  local -i result=0

  sanitizer "${F_BINARY}"
  ((result |= $?))

  return "${result}"
}

# Control flow logic

run_dast
exit "${?}"
