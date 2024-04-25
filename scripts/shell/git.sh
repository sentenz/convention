#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Library for git actions.

source "$(dirname "${BASH_SOURCE[0]}")/util.sh"

########################
# Gets the current git branch.
# Arguments:
#   None
# Returns:
#   $? - Name of the current branch.
#########################
function git_branch_current() {
  git rev-parse --abbrev-ref HEAD
}

########################
# Checks if a git branch exists, either locally or remotely.
# Arguments:
#   $1 - Branch
# Returns:
#   $? - 0 if the branch exists, 1 otherwise.
#########################
function git_branch_exist() {
  local branch="${1:?branch is missing}"

  if git show-ref --verify --quiet "refs/heads/${branch}"; then
    # Branch exists locally
    return 0
  fi

  if git show-ref --verify --quiet "refs/remotes/origin/${branch}"; then
    # Branch exists on remote origin
    return 0
  fi

  if git ls-remote --quiet --exit-code origin "${branch}" >/dev/null 2>&1; then
    # Branch exists on remote origin (but not yet fetched)
    return 0
  fi

  return 1
}

########################
# Checks if a git branch matches a regex pattern.
# Arguments:
#   $1 - Branch
#   $2 - Pattern
# Returns:
#   $? - 0 if the branch matches the pattern, 1 otherwise.
#########################
function git_branch_match() {
  local branch="${1:?branch is missing}"
  local pattern="${2:?pattern is missing}"

  util_regex_match "${branch}" "${pattern}"
  return $?
}
