#!/bin/bash
#
# Perform linter calls.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../../scripts/utils/log.sh
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

# Constant variables

readonly -a SCRIPTS=(
  alex
  write_good
  proselint
  codespell
  remark
  markdown_link_check
  # markdownlint
  # commitlint
  cppcheck
  cpplint
  clang_tidy
  clang_format
  # scan_build
  golangci_lint
  dockerfilelint
  licensecheck
  shellcheck
  shfmt
  prettier
  jsonlint
  yamllint
)

# Internal functions

initialize_logs() {
  local log_dir
  log_dir="$(get_root_dir)/logs/linter"
  local regex_patterns="^.*\.(log)$"

  if ! is_dir_empty "${log_dir}"; then
    find "${log_dir}" -type f -regextype posix-egrep -regex "${regex_patterns}" -delete
  fi

  create_dir "${log_dir}"

  return "${STATUS_SUCCESS}"
}

analyze() {
  local script="${1}"
  local f_lint="${2}"

  local -i result=0

  chmod +x "${script}.sh"
  ./"${script}.sh" -l "${f_lint}"
  ((result = $?))

  monitor "linter - ${f_lint}" "${script}" "${result}"

  if ((result == STATUS_SKIP)) || ((result == STATUS_WARNING)); then
    return "${STATUS_SUCCESS}"
  fi

  return "${result}"
}

run_linter() {
  local -a scripts=("$@")

  initialize_logs

  (
    local -i result=0

    cd "$(get_sript_dir)/../linter" || return "${STATUS_ERROR}"

    for script in "${scripts[@]}"; do
      analyze "${script}" "${F_LINT}"
      ((result |= $?))
    done

    return "${result}"
  )
}

# Control flow logic

run_linter "${SCRIPTS[@]}"
exit "${?}"
