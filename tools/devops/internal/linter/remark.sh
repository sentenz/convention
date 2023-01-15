#!/bin/bash
#
# Perform checks of markdown files by running remark.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/fs.sh
. ./../../scripts/utils/git.sh

# Constant variables

PATH_ROOT_DIR="$(git_get_root_dir)"
readonly PATH_ROOT_DIR
# readonly RC_FILE=".remarkrc.json"
# readonly RC_IGNORE_FILE=".remarkignore"
readonly LOG_FILE="${PATH_ROOT_DIR}/logs/linter/remark.log"
readonly REGEX_PATTERNS="^(?!.*\/?!*(\.git|vendor|external|CHANGELOG.md)).*\.(md)$"

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

analyzer() {
  local -a filepaths

  # Get files
  if [[ "${F_LINT}" == "ci" ]]; then
    filepaths=$(git_get_ci_files "${PATH_ROOT_DIR}" "${REGEX_PATTERNS}")
  elif [[ "${F_LINT}" == "diff" ]]; then
    filepaths=$(git_get_diff_files "${PATH_ROOT_DIR}" "${REGEX_PATTERNS}")
  elif [[ "${F_LINT}" == "staged" ]]; then
    filepaths=$(git_get_staged_files "${PATH_ROOT_DIR}" "${REGEX_PATTERNS}")
  else
    echo "error: unexpected option: ${F_LINT}" &>"${LOG_FILE}"

    return "${STATUS_ERROR}"
  fi

  if [[ -z "${filepaths}" ]]; then
    return "${STATUS_SKIP}"
  fi

  # Run linter
  local -r cmd="remark --no-stdout --no-color --silent"

  (
    cd "${PATH_ROOT_DIR}" || return "${STATUS_ERROR}"

    for filepath in "${filepaths[@]}"; do
      eval "${cmd}" "${filepath}"
    done
  ) &>"${LOG_FILE}"

  return "${STATUS_SUCCESS}"
}

logger() {
  if ! fs_is_file "${LOG_FILE}"; then
    return "${STATUS_SUCCESS}"
  fi

  local -i errors=0
  errors=$(grep -i -c -E 'error|warning' "${LOG_FILE}" || true)
  if ((errors != 0)); then
    return "${STATUS_ERROR}"
  fi

  fs_remove_file "${LOG_FILE}"

  return "${STATUS_SUCCESS}"
}

run_remark() {
  local -i result=0

  analyzer
  ((result |= $?))

  logger
  ((result |= $?))

  return "${result}"
}

# Control flow logic

run_remark
exit "${?}"
