#!/bin/bash
#
# Perform static application security testing (SAST).

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/fs.sh
. ./../../scripts/utils/git.sh

# Options

F_LINT="NULL"
while getopts 'l:' flag; do
  case "${flag}" in
    l) F_LINT="${OPTARG}" ;;
    *) ;;
  esac
done
readonly F_LINT

# Internal functions

linter() {
  local f_lint="${1:?linter flag is missing}"

  (
    local -i result=0

    cd "$(fs_get_sript_dir)/../../internal/app" || return "${STATUS_ERROR}"

    chmod +x linter.sh
    ./linter.sh -l "${f_lint}"
    ((result |= $?))

    return "${result}"
  )
}

run_sast() {
  local -i result=0

  linter "${F_LINT}"
  ((result |= $?))

  return "${result}"
}

# Control flow logic

run_sast
exit "${?}"
