#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Library for utility based on conditional expression.

########################
# Verify if string is empty or null.
# Arguments:
#   $1 - String
# Returns:
#   $? - 0 if the length of string is non-zero, 1 otherwise.
#########################
function util_string_exist() {
  local string="${1}"

  if [[ -z "${string}" ]]; then
    return 1
  fi

  return 0
}

########################
# Verify if strings are equal.
# Arguments:
#   $1 - String1
#   $2 - String2
# Returns:
#   $? - 0 if the strings are equal, 1 otherwise.
#########################
function util_string_equals() {
  local string1="${1:?missing}"
  local string2="${2:?missing}"

  if [[ "${string1}" != "${string2}" ]]; then
    return 1
  fi

  return 0
}

########################
# Verify if directory exist.
# Arguments:
#   $1 - Directory
#   $2 - Owner
# Returns:
#   $? - 0 if the directory exists, 1 otherwise.
#########################
function util_dir_exist() {
  local dir="${1:?missing}"

  if [[ ! -d "${dir}" ]]; then
    return 1
  fi

  return 0
}

########################
# Create directory path.
# Arguments:
#   $1 - Filepath
# Returns:
#   $? - directory path if successful, empty string otherwise.
#########################
function util_dir_create() {
  local file="${1:?missing}"

  local dir
  dir="$(dirname "${file}")"

  mkdir -p "$dir"
  echo "$dir"
}

########################
# Verify if directory is empty.
# Arguments:
#   $1 - Directory
#   $2 - Owner
# Returns:
#   $? - 0 if the directory is empty, 1 otherwise.
#########################
function util_dir_empty() {
  local dir="${1:?missing}"

  if [[ -n "$(ls -A "${dir}")" ]]; then
    return 1
  fi

  return 0
}

########################
# Verify if file exists.
# Arguments:
#   $1 - Filename
# Returns:
#   $? - 0 if file exists, 1 otherwise.
#########################
function util_file_exist() {
  local file="${1:?missing}"

  if [[ ! -f "${file}" ]]; then
    return 1
  fi

  return 0
}

########################
# Verify if file is empty.
# Arguments:
#   $1 - Filename
# Returns:
#   $? - 0 if file is empty, 1 otherwise.
#########################
function util_file_empty() {
  local file="${1:?missing}"

  if [[ -s "${file}" ]]; then
    return 1
  fi

  return 0
}

########################
# Create a file.
# Arguments:
#   $1 - Filename
# Returns:
#   $? - 0 if the file is created, 1 otherwise.
#########################
function util_file_create() {
  local file="${1:?missing}"

  if util_file_exist "${file}"; then
    return 1
  fi

  util_dir_create "${file}"
  echo -n >"${file}"
}

########################
# Perform a regex match against the specified pattern.
# Arguments:
#   $1 - String
#   $2 - Pattern (must be unquoted)
# Returns:
#   $? - 0 if the pattern matchs, 1 otherwise.
#########################
function util_regex_match() {
  local string="${1:?missing}"
  local pattern="${2:?missing}"

  if [[ ! "${string}" =~ $pattern ]]; then
    return 1
  fi

  return 0
}
