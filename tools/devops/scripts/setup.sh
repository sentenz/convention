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
  make
  dirmngr
)
readonly -a SCRIPTS=(
  setup_integration.sh
)
readonly -a PIPELINES=(
  continuous-integration.yml
  continuous-release.yml
  continuous-security.yml
  continuous-testing.yml
)

# Internal functions

initialize_repo() {
  git_configure_repo_ownership
  chmod +x "$(fs_get_sript_dir)"/../internal/*/*.sh
}

initialize_scripts() {
  if fs_is_dir "$(fs_get_sript_dir)/pipeline"; then
    fs_create_dir "$(git_get_root_dir)/scripts"
    fs_copy_files "$(fs_get_sript_dir)/pipeline" "$(git_get_root_dir)/scripts"
  fi

  if fs_is_dir "$(fs_get_sript_dir)/utils"; then
    fs_create_dir "$(git_get_root_dir)/scripts"
    fs_copy_files "$(fs_get_sript_dir)/utils" "$(git_get_root_dir)/scripts"
  fi
}

initialize_githooks() {
  if fs_is_dir "$(fs_get_sript_dir)/../githooks"; then
    fs_copy_files "$(fs_get_sript_dir)/../githooks" "$(git_get_root_dir)"
    chmod +x "$(git_get_root_dir)"/githooks/*
    git config core.hooksPath githooks
  fi
}

initialize_dotfiles() {
  if fs_is_dir "$(fs_get_sript_dir)/../dotfiles"; then
    fs_copy_files "$(fs_get_sript_dir)/../dotfiles" "$(git_get_root_dir)"
    fs_copy_files "$(fs_get_sript_dir)/../dotfiles/." "$(git_get_root_dir)"
  fi
}

initialize_pipelines() {
  if fs_is_dir "$(fs_get_sript_dir)/../.azure"; then
    fs_copy_files "$(fs_get_sript_dir)/../.azure" "$(git_get_root_dir)"
  fi

  if fs_is_dir "$(fs_get_sript_dir)/../.github"; then
    fs_copy_files "$(fs_get_sript_dir)/../.github" "$(git_get_root_dir)"
  fi
}

initialize_container() {
  if fs_is_dir "$(fs_get_sript_dir)/../.devcontainer"; then
    fs_copy_files "$(fs_get_sript_dir)/../.devcontainer" "$(git_get_root_dir)"
  fi

  if fs_is_dir "$(fs_get_sript_dir)/../build/container"; then
    fs_create_dir "$(git_get_root_dir)/build/container"
    fs_copy_files "$(fs_get_sript_dir)/../build/container" "$(git_get_root_dir)/build"
  fi
}

initialize_merge() {
  if fs_is_file "$(fs_get_sript_dir)/../Makefile"; then
    fs_merge_file "$(fs_get_sript_dir)/../Makefile" "$(git_get_root_dir)/Makefile"
  fi

  if fs_is_dir "$(fs_get_sript_dir)/../.vscode"; then
    fs_merge_file "$(fs_get_sript_dir)/../.vscode/extensions.json" "$(git_get_root_dir)/.vscode/extensions.json"
  fi

  for pipeline in "${PIPELINES[@]}"; do
    if fs_is_file "$(fs_get_sript_dir)/../.azure/${pipeline}"; then
      fs_merge_file "$(fs_get_sript_dir)/../.azure/${pipeline}" "$(git_get_root_dir)/.azure/${pipeline}"
    fi
  done

  for pipeline in "${PIPELINES[@]}"; do
    if fs_is_file "$(fs_get_sript_dir)/../.github/workflows/${pipeline}"; then
      fs_merge_file "$(fs_get_sript_dir)/../.github/workflows/${pipeline}" "$(git_get_root_dir)/.github/workflows/${pipeline}"
    fi
  done
}

run_scripts() {
  local -a scripts=("$@")

  (
    local -i result=0

    cd "$(fs_get_sript_dir)/pipeline" || return "${STATUS_ERROR}"

    for script in "${scripts[@]}"; do
      chmod +x "${script}"
      ./"${script}"
      ((result |= $?))
    done

    return "${result}"
  )
}

setup() {
  local -i result=0

  util_install_apt_packages "${APT_PACKAGES[@]}"
  ((result |= $?))

  run_scripts "${SCRIPTS[@]}"
  ((result |= $?))

  initialize_repo
  initialize_scripts
  initialize_dotfiles
  initialize_githooks
  initialize_pipelines
  initialize_container
  initialize_merge

  util_cleanup_apt
  ((result |= $?))

  return "${result}"
}

# Control flow logic

setup
exit "${?}"
