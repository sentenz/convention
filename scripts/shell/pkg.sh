#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Library for package management actions.

source "$(dirname "${BASH_SOURCE[0]}")/log.sh"
source "$(dirname "${BASH_SOURCE[0]}")/util.sh"

########################
# Generic package list iteration.
# Arguments:
#   $1 - function
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_list() {
  local func="${1:?function is missing}"
  local -n packages="${2:?array is missing}"

  local -i retval=0
  local -i result=0

  for key in "${!packages[@]}"; do
    "$func" "${key}" "${packages[$key]}"
    ((result = $?))
    ((retval |= "${result}"))

    log_message "package" "${key} ${packages[$key]}" "${result}"
  done

  return "${retval}"
}

########################
# Install apt package dependency.
# Arguments:
#   $1 - package
#   $2 - version
# Returns:
#   $? - Boolean
#########################
function pkg_apt_install() {
  local package="${1:?package is missing}"
  local version="${2:-}"

  local -i retval=0

  if ! command -v "${package}" &>/dev/null; then
    if util_string_exist "${version}"; then
      apt install "${package}"="${version}" -qqq -y --no-install-recommends
      ((retval = $?))
    else
      apt install "${package}" -qqq -y --no-install-recommends
      ((retval = $?))
    fi
  fi

  return "${retval}"
}

########################
# Uninstall apt package dependency.
# Arguments:
#   $1 - package
# Returns:
#   $? - Boolean
#########################
function pkg_apt_uninstall() {
  local package="${1:?package is missing}"

  local -i retval=0

  if command -v "${package}" &>/dev/null; then
    apt remove -y -qqq "${package}"
    ((retval = $?))
  fi

  return "${retval}"
}

########################
# Update apt package dependencies.
# Arguments:
#   None
# Returns:
#   None
#########################
function pkg_apt_update() {
  apt update -qqq
}

########################
# Cleanup apt package dependencies.
# Arguments:
#   None
# Returns:
#   $? - Boolean
#########################
function pkg_apt_clean() {
  local -i retval=0

  apt -f install -y -qqq
  ((retval |= $?))

  apt autoremove -y -qqq
  ((retval |= $?))

  apt clean -qqq
  ((retval |= $?))

  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
  ((retval |= $?))

  log_message "clean" "apt" "${retval}"

  return "${retval}"
}

########################
# Install apt package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_apt_install_list() {
  local -A packages="${1:?array is missing}"

  local -i retval=0

  pkg_apt_update
  pkg_list pkg_apt_install "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}

########################
# Uninstall apt package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_apt_uninstall_list() {
  local -a packages=("$@")
  local -i retval=0

  pkg_list pkg_apt_uninstall "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}

########################
# Install snap package dependency.
# Arguments:
#   $1 - package
#   $2 - version
# Returns:
#   $? - Boolean
#########################
function pkg_snap_install() {
  local package="${1:?package is missing}"
  local version="${2:-}"

  local -i retval=0

  if ! command -v "${package}" &>/dev/null; then
    if util_string_exist "${version}"; then
      snap install "${package}" --channel="${version}"/stable --classic --quiet
      ((retval = $?))
    else
      snap install "${package}" --classic --quiet
      ((retval = $?))
    fi
  fi

  return "${retval}"
}

########################
# Install pip package dependency.
# Arguments:
#   $1 - package
#   $2 - version
# Returns:
#   $? - Boolean
#########################
function pkg_pip_install() {
  local package="${1:?package is missing}"
  local version="${2:-}"

  local -i retval=0

  if ! pip3 show "${package}" &>/dev/null; then
    # HACK PEP 668 - Check Python version to avoid pip break
    if [[ $(python3 -c 'import sys; print(sys.version_info >= (3, 11))') == 'True' ]]; then
      if util_string_exist "${version}"; then
        pip3 install "${package}"=="${version}" --break-system-packages -q
        ((retval = $?))
      else
        pip3 install "${package}" --break-system-packages -q
        ((retval = $?))
      fi
    else
      if util_string_exist "${version}"; then
        pip3 install "${package}"=="${version}" -q
        ((retval = $?))
      else
        pip3 install "${package}" -q
        ((retval = $?))
      fi
    fi
  fi

  return "${retval}"
}

########################
# Cleanup pip package dependencies.
# Arguments:
#   None
# Returns:
#   $? - Boolean
#########################
function pkg_pip_clean() {
  local -i retval=0

  pip3 cache purge -q
  ((retval |= $?))

  log_message "clean" "pip" "${retval}"

  return "${retval}"
}

########################
# Install snap package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_snap_install_list() {
  local -A packages="${1:?array is missing}"

  local -i retval=0

  pkg_list pkg_snap_install "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}

########################
# Install pip package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_pip_install_list() {
  local -A packages="${1:?array is missing}"

  local -i retval=0

  pkg_list pkg_pip_install "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}

########################
# Install npm package dependency.
# Arguments:
#   $1 - package
#   $2 - version
# Returns:
#   $? - Boolean
#########################
function pkg_npm_install() {
  local package="${1:?package is missing}"
  local version="${2:-}"

  local -i retval=0

  if ! npm list "${package}" -g --depth=0 &>/dev/null; then
    if util_string_exist "${version}"; then
      npm install "${package}"@"${version}" --silent -g
      ((retval = $?))
    else
      npm install "${package}"@latest --silent -g
      ((retval = $?))
    fi
  fi

  return "${retval}"
}

########################
# Uninstall npm package dependency.
# Arguments:
#   $1 - package
# Returns:
#   $? - Boolean
#########################
function pkg_npm_uninstall() {
  local package="${1:?package is missing}"

  local -i retval=0

  if ! npm list "${package}" -g --depth=0 &>/dev/null; then
    npm uninstall "${package}" --silent -g
    ((retval = $?))
  fi

  return "${retval}"
}

########################
# Install npm package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_npm_install_list() {
  local -A packages="${1:?array is missing}"

  local -i retval=0

  pkg_list pkg_npm_install "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}

########################
# Cleanup npm package dependencies.
# Arguments:
#   None
# Returns:
#   $? - Boolean
#########################
function pkg_npm_clean() {
  local -i retval=0

  npm cache clean --force --silent
  ((retval = $?))

  log_message "clean" "npm" "${retval}"

  return "${retval}"
}

########################
# Install go package dependency.
# Arguments:
#   $1 - package
#   $2 - version
# Returns:
#   $? - Boolean
#########################
function pkg_go_install() {
  local package="${1:?package is missing}"
  local version="${2:-}"

  local -i retval=0

  if ! command -v "${package}" &>/dev/null; then
    if util_string_exist "${version}"; then
      go install "${package}"@"${version}"
      ((retval = $?))
    else
      go install "${package}@latest"
      ((retval = $?))
    fi
  fi

  return "${retval}"
}

########################
# Install go package list dependencies.
# Arguments:
#   $@ - packages
# Returns:
#   $? - Boolean
#########################
function pkg_go_install_list() {
  local -A packages="${1:?array is missing}"

  local -i retval=0

  pkg_list pkg_go_install "${packages[@]}"
  ((retval |= $?))

  return "${retval}"
}
