#!/bin/bash
#
# Perform checks of commit messages by running commitlint.

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
# readonly RC_FILE=".commitlintrc.yml"
readonly LOG_FILE="${PATH_ROOT_DIR}/logs/linter/commitlint.log"

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
    return "${STATUS_SUCCESS}"
  elif [[ "${F_LINT}" == "diff" ]]; then
    return "${STATUS_SUCCESS}"
  elif [[ "${F_LINT}" == "staged" ]]; then
    filepaths="$(git_get_root_dir)/.git/COMMIT_EDITMSG"
  else
    echo "error: unexpected option: ${F_LINT}" &>"${LOG_FILE}"

    return "${STATUS_ERROR}"
  fi

  if [[ -z "${filepaths}" ]]; then
    return "${STATUS_SKIP}"
  fi

  # Run linter
  local -r cmd="commitlint --edit"

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
  errors=$(grep -i -c -E '[1-9]{1,} problems|warnings' "${LOG_FILE}" || true)
  if ((errors != 0)); then
    return "${STATUS_ERROR}"
  fi

  fs_remove_file "${LOG_FILE}"

  return "${STATUS_SUCCESS}"
}

run_commitlint() {
  local -i result=0

  analyzer
  ((result |= $?))

  logger
  ((result |= $?))

  return "${result}"
}

# Control flow logic

run_commitlint
exit "${?}"
