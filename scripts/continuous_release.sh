#!/bin/bash
#
# Perform dependency installation for release.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
# -o posix: match the standard
set -uo pipefail

# Constant variables

PATH_TOPLEVEL="$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"
readonly PATH_TOPLEVEL
readonly -a NPM_PACKAGES=(
  semantic-release
  semantic-commitlint
  semantic-release-commitlint
  @semantic-release/git
  @semantic-release/changelog
  @semantic-release/error
  @semantic-release/exec
  @semantic-release/github
  @semantic-release/commit-analyzer
  @semantic-release/release-notes-generator

  # Default plugins
  #@semantic-release/npm
  #semantic-release-ado
)

# Internal functions

function printer() {
  echo -e "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

function monitor() {
  local task="$1"
  local package="$2"
  local status="$3"

  if ((status == 0)); then
    printer "🟢 [${task}] succeeded ${package}"
  else
    printer "🟠 [${task}] failed ${package}"
  fi
}

function install_npm_dependency() {
  local package="$1"

  local -i result=0

  if ! npm list "${package}"@latest -g --depth=0 &>/dev/null; then
    sudo -H npm i --silent -g "${package}"@latest --unsafe-perm
    ((result |= $?))
  fi

  monitor "Install" "${package}" "${result}"

  return "${result}"
}

# Control flow logic

cd "${PATH_TOPLEVEL}" || exit

declare -i retval=0

# Install npm requirements

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
((retval |= $?))

# Install npm dependencies

for package in "${NPM_PACKAGES[@]}"; do
  install_npm_dependency "${package}"
  ((retval |= $?))
done

exit "${retval}"
