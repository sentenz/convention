#!/bin/bash
#
# Library for file system actions.

########################
# Ensure a file/directory is owned (user and group) but the given user.
# Arguments:
#   $1 - filepath
#   $2 - owner
# Returns:
#   None
#########################
fs_owned_by() {
  local path="${1:?path is missing}"
  local owner="${2:?owner is missing}"

  chown -R "$owner":"$owner" "$path"
}

########################
# Check if a file exists.
# Arguments:
#   $1 - filename
#   $2 - owner
# Returns:
#   Boolean
#########################
fs_is_file() {
  local filename="${1:?filename is missing}"

  if [[ ! -f "${filename}" ]]; then
    return 1
  fi

  return 0
}

########################
# Check if a directory exists.
# Arguments:
#   $1 - directory
#   $2 - owner
# Returns:
#   Boolean
#########################
fs_is_dir() {
  local dir="${1:?directory is missing}"

  if [[ ! -d "${dir}" ]]; then
    return 1
  fi

  return 0
}

########################
# Copy file or directory that prevents accidentally overwriting any files.
# Arguments:
#   $1 - source file or directory
#   $2 - destination directory
# Returns:
#   None
#########################
fs_copy_files() {
  local src="${1:?source is missing}"
  local dest="${2:?destination is missing}"

  cp -rn "${src}" "${dest}"
}

########################
# Merge a source file into a destination file.
# Arguments:
#   $1 - source filename
#   $2 - destination filename
# Returns:
#   None
#########################
fs_merge_file() {
  local src="${1:?source filename is missing}"
  local dest="${2:?destination filename is missing}"

  local tmp="diff.txt"

  touch "${dest}"
  diff --line-format="%L" -D MERGE_DEVOPS -B "${src}" "${dest}" >"${tmp}"
  mv "${tmp}" "${dest}"
}

########################
# Ensure a directory exists and, optionally, is owned by the given user.
# Arguments:
#   $1 - directory
#   $2 - owner
# Returns:
#   None
#########################
fs_create_dir() {
  local dir="${1:?directory is missing}"
  local owner="${2:-}"

  mkdir -p "${dir}"
  if [[ -n $owner ]]; then
    fs_owned_by "$dir" "$owner"
  fi
}

########################
# Creates a empty file and the directore if not exist.
# Arguments:
#   $1 - filename
# Returns:
#   None
#########################
fs_create_file() {
  local filename="${1:?filename is missing}"

  fs_create_dir "$(dirname "${filename}")" && touch "${filename}"
}

########################
# Removes a file.
# Arguments:
#   $1 - filename
# Returns:
#   None
#########################
fs_remove_file() {
  local filename="${1:?filename is missing}"

  rm -f "${filename}"
}

########################
# Removes a directory recursively.
# Arguments:
#   $1 - directory
# Returns:
#   None
#########################
fs_remove_dir() {
  local dir="${1:?directory is missing}"

  rm -rf "${dir}"
}

########################
# Removes a empty file.
# Arguments:
#   $1 - filename
# Returns:
#   None
#########################
fs_remove_empty_file() {
  local filename="${1:?filename is missing}"

  if fs_is_file_empty "${filename}"; then
    rm -f "${filename}"
  fi
}

########################
# Checks whether a directory is empty or not.
# Arguments:
#   $1 - directory
# Returns:
#   Boolean
#########################
fs_is_dir_empty() {
  local dir="${1:?directory is missing}"

  if fs_is_dir "${dir}"; then
    return 1
  fi

  if [[ -n "$(ls -A "${dir}")" ]]; then
    return 1
  fi

  return 0
}

########################
# Checks whether a file is empty or not.
# Arguments:
#   $1 - filename
# Returns:
#   Boolean
#########################
fs_is_file_empty() {
  local filename="${1:?filename is missing}"

  if [[ -f "${filename}" && -s "${filename}" ]]; then
    return 1
  fi

  return 0
}

########################
# Get the absolute path of the executed script by command substitution.
# Arguments:
#   None
# Returns:
#   Path
#########################
fs_get_sript_dir() {
  local retval
  retval="$(dirname "$(realpath "$0")")"

  echo "${retval}"
}

########################
# Configure permissions and ownership recursively.
# Globals:
#   None
# Arguments:
#   $1 - paths (as a string).
# Flags:
#   -f|--file-mode - mode for directories.
#   -d|--dir-mode - mode for files.
#   -u|--user - user
#   -g|--group - group
# Returns:
#   None
#########################
fs_configure_permissions_ownership() {
  local -r paths="${1:?paths is missing}"

  local dir_mode=""
  local file_mode=""
  local user=""
  local group=""

  # Validate arguments
  shift 1
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -f | --file-mode)
        shift
        file_mode="${1:?missing mode for files}"
        ;;
      -d | --dir-mode)
        shift
        dir_mode="${1:?missing mode for directories}"
        ;;
      -u | --user)
        shift
        user="${1:?missing user}"
        ;;
      -g | --group)
        shift
        group="${1:?missing group}"
        ;;
      *)
        echo "Invalid command line flag $1" >&2
        return "${STATUS_ERROR}"
        ;;
    esac
    shift
  done

  read -r -a filepaths <<<"$paths"
  for p in "${filepaths[@]}"; do
    if [[ -e "$p" ]]; then
      if [[ -n $dir_mode ]]; then
        find -L "$p" -type d -exec chmod "$dir_mode" {} \;
      fi
      if [[ -n $file_mode ]]; then
        find -L "$p" -type f -exec chmod "$file_mode" {} \;
      fi
      if [[ -n $user ]] && [[ -n $group ]]; then
        chown -LR "$user":"$group" "$p"
      elif [[ -n $user ]] && [[ -z $group ]]; then
        chown -LR "$user" "$p"
      elif [[ -z $user ]] && [[ -n $group ]]; then
        chgrp -LR "$group" "$p"
      fi
    else
      error "$p does not exist"
    fi
  done
}
