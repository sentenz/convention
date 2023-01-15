#!/bin/bash
#
# Library for git actions.

########################
# Configure ownership in repository.
# Arguments:
#   None
# Returns:
#   None
#########################
git_configure_repo_ownership() {
  git config --global --add safe.directory "$(git_get_root_dir)"
}

########################
# Get the absolute path of the root project by command substitution.
# Arguments:
#   None
# Returns:
#   Path
#########################
git_get_root_dir() {
  local retval
  retval="$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"

  echo "${retval}"
}

########################
# Check if the repository is valid.
# Arguments:
#   None
# Returns:
#   Boolean
#########################
git_valid_repo() {
  local path
  path="$(git_get_root_dir)"

  if [[ -z "${path}" ]]; then
    return 1
  fi

  if [[ ! -d "${path}/.git" ]]; then
    return 1
  fi

  return 0
}

########################
# Get the current local branch name by command substitution.
# Arguments:
#   None
# Returns:
#   Branch
#########################
git_get_local_branch() {
  local retval
  retval="$(git rev-parse --abbrev-ref HEAD)"

  echo "${retval}"
}

########################
# Get the staged files by command substitution and, optionally, with path prefix and filtered by a
# regex pattern.
# Arguments:
#   $1 - path-prefix
#   $2 - regex-pattern
# Returns:
#   List
#########################
git_get_staged_files() {
  local path="${1:-}"
  local regex="${2:-}"

  local retval
  retval=$(git diff --submodule=diff --diff-filter=d --name-only --line-prefix="${path}/" --cached | grep -P "${regex}" | xargs)

  echo "${retval}"
}

########################
# Get the changed files between commits by command substitution and, optionally, with path prefix
# and filtered by a regex pattern.
# Arguments:
#   $1 - path-prefix
#   $2 - regex-pattern
# Returns:
#   List
#########################
git_get_diff_files() {
  local path="${1:-}"
  local regex="${2:-}"

  local retval
  retval=$(git diff --submodule=diff --diff-filter=d --name-only --line-prefix="${path}/" remotes/origin/HEAD... | grep -P "${regex}" | xargs)

  echo "${retval}"
}

########################
# Get the changed files between commits by command substitution in continuous integration pipeline
# and, optionally, with path prefix and filtered by a regex pattern.
# Arguments:
#   $1 - path-prefix
#   $2 - regex-pattern
# Returns:
#   List
#########################
git_get_ci_files() {
  local path="${1:-}"
  local regex="${2:-}"

  local retval
  retval=$(git diff --submodule=diff --diff-filter=d --name-only --line-prefix="${path}/" remotes/origin/main... | grep -P "${regex}" | xargs)

  echo "${retval}"
}
