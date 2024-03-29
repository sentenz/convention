#!/bin/bash
#
# Library for git hook actions.

########################
# Prevent a direct push to the base branches.
# Arguments:
#   $1 - local branch
#   $@ - base branches
# Returns:
#   Boolean
#########################
hook_prevent_push_to_base_branches() {
  local local_branch="${1:?local branch is missing}"
  local -a base_branches=("${@:2}")

  for branch in "${base_branches[@]}"; do
    if [[ "${branch}" == "${local_branch}" ]]; then
      cat << END
___________________________________________________________________________________________________
Branching Strategy

Prevent a direct push to the base branches.

Noting that contributions to base branches are not compliant with the branching strategy.
Contributing to a base branch can only be made via pull requests (PR). Create a support branch
from and merge back to a base branch.

See https://sentenz.github.io/guide/internal/guides/branching-strategies-guide.html
___________________________________________________________________________________________________
END

      return 1
    fi
  done

  return 0
}

########################
# Enforce naming convention for support branches.
# Arguments:
#   $1 - local branch
#   $@ - support branches
# Returns:
#   Boolean
#########################
hook_enforce_naming_convention_of_support_branch() {
  local local_branch="${1:?local branch is missing}"
  local -a support_branches=("${@:2}")

  regex_patterns="^($(
    IFS=$'|'
    echo "${support_branches[*]}"
  ))\/[0-9]+[-][a-z-]+$"
  readonly regex_patterns

  if [[ ! "${local_branch}" =~ ${regex_patterns} ]]; then
    cat << END
___________________________________________________________________________________________________
Branching Strategy

Enforce naming convention for support branches.

There is something wrong with the name of the local branch "${local_branch}". Rename the local
branch according to the naming convention for support branches.

The naming rule is: [support-branch]/[issue-id]-[short-description].

  1. support-branch: feature, release, and fix.
  2. followed by a slash (/)
  3. issue-id: in digit(s)
  4. short-description: only lowercase letters, separated by hyphens

Example: feature/158-enforce-policy

See https://sentenz.github.io/guide/internal/guides/branching-strategies-guide.html
___________________________________________________________________________________________________
END

    return 1
  fi

  return 0
}

########################
# Enforce coding standards and static analysis through linting and code style checks.
# Arguments:
#   $1 - executable command
# Returns:
#   Boolean
#########################
hook_enforce_coding_standards() {
  local cmd="${1:?executable command is missing}"

  local -i result=0

  bash -c "${cmd}"
  ((result = $?))

  if ((result != 0)); then
    cat << END
___________________________________________________________________________________________________
Static Code Analysis

Enforce coding standards and static analysis through linting and code style checks.

See https://sentenz.github.io/https://sentenz.github.io/guide/internal/articles/software-analysis.html
___________________________________________________________________________________________________
END
  fi

  return "${result}"
}

########################
# Enforce the conventional commits specification to commit messages.
# Arguments:
#   $1 - executable command
#   $2 - commit message file
# Returns:
#   Boolean
#########################
hook_enforce_commit_message_convention() {
  local cmd="${1:?executable command is missing}"
  local commit="${2:?commit message file is missing}"

  local -i result=0

  bash -c "${cmd}"
  ((result = $?))

  if ((result != 0)); then
    cat << END
___________________________________________________________________________________________________
Commit Message Convention

Enforce the conventional commits specification to commit messages.

There is something wrong with the commit message:

  "$(cat "${commit}")"

A commit message that is compliant with Conventional Commits consists of the format:

  <type>(<scope>): <short summary>

See https://sentenz.github.io/guide/internal/guides/commit-message-guide.html
___________________________________________________________________________________________________
END
  fi

  return "${result}"
}

########################
# Enforce to create the support branches from the base branches.
# Arguments:
#   $1 - local branch
#   $2 - flag checkout
#   $@ - base branches
# Returns:
#   Boolean
#########################
hook_enforce_checkout_from_base_branches() {
  local local_branch="${1:?local branch is missing}"
  local flag_checkout="${2:?checkout flag is missing}"
  local -a base_branches=("${@:3}")

  if [[ "${flag_checkout}" == 0 ]]; then
    return 0
  fi

  parant_branch="$(git show-branch |
    sed "s/].*//" |
    grep "\*" |
    grep -v "${local_branch}" |
    head -n1 |
    sed "s/^.*\[//")"

  if [[ -z "${parant_branch}" ]]; then
    return 0
  fi

  for branch in "${base_branches[@]}"; do
    if [[ "${branch}" == "${parant_branch}" ]]; then
      return 0
    fi
  done

  git checkout "${parant_branch}"
  git branch -d "${local_branch}"

  cat << END
___________________________________________________________________________________________________
Branching Strategy

Enforce to create the support branches from the base branches.

Branch "${local_branch}" is created from "${parant_branch}".
Though, support branches should be created from a base branch, e.g. "${base_branches[@]}".

See https://sentenz.github.io/guide/internal/guides/branching-strategies-guide.html
___________________________________________________________________________________________________
END

  return 1
}
