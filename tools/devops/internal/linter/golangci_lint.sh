#!/bin/bash
#
# Perform checks of go files by running golangci-lint.

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
# readonly RC_FILE=".golangci.yml"
# readonly FILE_RC_LICENSE=".golangci-licenses"
readonly LOG_FILE="${PATH_ROOT_DIR}/logs/linter/golangci-lint.log"
readonly REGEX_PATTERNS="^(?!.*\/?!*(\.git|vendor|external|CHANGELOG.md)).*\.(go)$"

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
  local -r cmd="golangci-lint run --fast"

  # FIXME(AK) https://github.com/actions/setup-go/issues/14
  export PATH="${HOME}"/go/bin:/usr/local/go/bin:"${PATH}"

  (
    cd "${PATH_ROOT_DIR}" || return "${STATUS_ERROR}"

    for filepath in "${filepaths[@]}"; do
      eval "${cmd}" "${filepath}"
    done
  ) &>"${LOG_FILE}"

  return "${STATUS_SUCCESS}"
}

logger() {
  if ! fs_is_file_empty "${LOG_FILE}"; then
    return "${STATUS_ERROR}"
  fi

  fs_remove_file "${LOG_FILE}"

  return "${STATUS_SUCCESS}"
}

run_golangci_lint() {
  local -i result=0

  analyzer
  ((result |= $?))

  logger
  ((result |= $?))

  return "${result}"
}

# Control flow logic

run_golangci_lint
exit "${?}"
