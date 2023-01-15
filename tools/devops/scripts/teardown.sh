#!/bin/bash
#
# Perform devops environment setup.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include libraries

. ./../scripts/utils/fs.sh
. ./../scripts/utils/git.sh
. ./../scripts/utils/util.sh

# Constant variables

readonly -a APT_PACKAGES=(
  software-properties-common
  build-essential
  git
  automake
  python3
  python-is-python3
  python3-pip
  cmake
  dirmngr
)
readonly -a HOOKS=(
  commit-msg
  post-checkout
  pre-commit
  pre-rebase
)
readonly -a SCRIPTS=(
  setup_integration.sh
  setup_release.sh
  setup_testing.sh
  fs.sh
  git.sh
  hook.sh
  log.sh
  os.sh
  util.sh
)
readonly -a PIPELINES=(
  continuous-integration.yml
  continuous-release.yml
  continuous-security.yml
  continuous-testing.yml
)
readonly -a CONTAINERS=(
  devcontainer.dockerfile
)

# Internal functions

cleanup_scripts() {
  for script in "${SCRIPTS[@]}"; do
    if fs_is_file "$(git_get_root_dir)/scripts/pipeline/${script}"; then
      fs_remove_file "$(git_get_root_dir)/scripts/pipeline/${script}"
    fi
  done

  for script in "${SCRIPTS[@]}"; do
    if fs_is_file "$(git_get_root_dir)/scripts/utils/${script}"; then
      fs_remove_file "$(git_get_root_dir)/scripts/utils/${script}"
    fi
  done
}

cleanup_githooks() {
  for hook in "${HOOKS[@]}"; do
    if fs_is_file "$(git_get_root_dir)/githooks/${hook}"; then
      fs_remove_file "$(git_get_root_dir)/githooks/${hook}"
    fi
  done
}

cleanup_dotfiles() {
  if fs_is_dir "$(git_get_root_dir)/dotfiles"; then
    fs_remove_dir "$(git_get_root_dir)/dotfiles"
  fi
}

cleanup_pipelines() {
  for pipeline in "${PIPELINES[@]}"; do
    if fs_is_file "$(git_get_root_dir)/.azure/${pipeline}"; then
      fs_remove_file "$(git_get_root_dir)/.azure/${pipeline}"
    fi
  done

  for pipeline in "${PIPELINES[@]}"; do
    if fs_is_file "$(git_get_root_dir)/.github/workflows/${pipeline}"; then
      fs_remove_file "$(git_get_root_dir)/.github/workflows/${pipeline}"
    fi
  done
}

cleanup_container() {
  for container in "${CONTAINERS[@]}"; do
    if fs_is_file "$(git_get_root_dir)/build/container/${container}"; then
      fs_remove_file "$(git_get_root_dir)/build/container/${container}"
    fi
  done
}

teardown() {
  local -i retval=0

  util_uninstall_apt_packages "${APT_PACKAGES[@]}"
  ((retval |= $?))

  util_cleanup_apt
  ((retval |= $?))

  cleanup_scripts
  cleanup_dotfiles
  cleanup_githooks
  cleanup_pipelines
  cleanup_container

  return "${retval}"
}

# Control flow logic

teardown
exit "${?}"
