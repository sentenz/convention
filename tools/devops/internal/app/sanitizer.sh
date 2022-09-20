#!/bin/bash
#
# Perform sanitizer calls.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/log.sh
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

# Constant variables

readonly -a SCRIPTS=(
  valgrind
)

# Internal functions

initialize_logs() {
  local log_dir
  log_dir="$(get_root_dir)/logs/sanitizer"
  local regex_patterns="^.*\.(log)$"

  if ! is_dir_empty "${log_dir}"; then
    find "${log_dir}" -type f -regextype posix-egrep -regex "${regex_patterns}" -delete
  fi

  create_dir "${log_dir}"

  return "${STATUS_SUCCESS}"
}

analyze() {
  local script="${1:?script is missing}"
  local f_binary="${2:?binary is missing}"

  local -i result=0

  chmod +x "${script}.sh"
  ./"${script}.sh" -b "${f_binary}"
  ((result = $?))

  monitor "sanitizer - ${f_binary}" "${script}" "${result}"

  if ((result == STATUS_SKIP)) || ((result == STATUS_WARNING)); then
    return "${STATUS_SUCCESS}"
  fi

  return "${result}"
}

run_sanitizer() {
  local -a scripts=("$@")

  initialize_logs

  (
    local -i result=0

    cd "$(get_sript_dir)/../sanitizer" || return "${STATUS_ERROR}"

    for script in "${scripts[@]}"; do
      analyze "${script}" "${F_BINARY}"
      ((result |= $?))
    done

    return "${result}"
  )
}

# Control flow logic

run_sanitizer "${SCRIPTS[@]}"
exit "${?}"
