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
owned_by() {
  local path="${1:?path is missing}"
  local owner="${2:?owner is missing}"

  chown -R "$owner":"$owner" "$path"
}

########################
# Check if a file exists.
# Arguments:
#   $1 - file
#   $2 - owner
# Returns:
#   Boolean
#########################
is_file() {
  local file="${1:?file is missing}"

  if [[ -f "$file" ]]; then
    true
  else
    false
  fi
}

########################
# Check if a directory exists.
# Arguments:
#   $1 - directory
#   $2 - owner
# Returns:
#   Boolean
#########################
is_dir() {
  local dir="${1:?directory is missing}"

  if [[ -d "$dir" ]]; then
    true
  else
    false
  fi
}

########################
# Copy file or directory that prevents accidentally overwriting any files.
# Arguments:
#   $1 - source file or directory
#   $2 - destination directory
# Returns:
#   None
#########################
copy_files() {
  local src="${1:?source is missing}"
  local dest="${2:?destination is missing}"

  cp -rn "${src}" "${dest}"
}

########################
# Merge a source file into a destination file.
# Arguments:
#   $1 - source file
#   $2 - destination file
# Returns:
#   None
#########################
merge_file() {
  local src="${1:?source is missing}"
  local dest="${2:?destination is missing}"

  local tmp="diff.txt"

  diff --line-format="%L" -D MERGE -B "${src}" "${dest}" >"${tmp}"
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
create_dir() {
  local dir="${1:?directory is missing}"
  local owner="${2:-}"

  mkdir -p "${dir}"
  if [[ -n $owner ]]; then
    owned_by "$dir" "$owner"
  fi
}

########################
# Creates a empty file and the directore if not exist.
# Arguments:
#   $1 - file
# Returns:
#   None
#########################
create_file() {
  local file="${1:?file is missing}"

  create_dir "$(dirname "${file}")" && touch "${file}"
}

########################
# Removes a file.
# Arguments:
#   $1 - file
# Returns:
#   None
#########################
remove_file() {
  local file="${1:?file is missing}"

  rm -f "${file}"
}

########################
# Removes a empty file.
# Arguments:
#   $1 - file
# Returns:
#   None
#########################
remove_empty_file() {
  local file="${1:?file is missing}"

  if is_file_empty "${file}"; then
    rm -f "${file}"
  fi
}

########################
# Checks whether a directory is empty or not.
# Arguments:
#   $1 - directory
# Returns:
#   Boolean
#########################
is_dir_empty() {
  local dir="${1:?missing directory}"

  if [[ ! -e "$dir" ]] || [[ -z "$(ls -A "$dir")" ]]; then
    true
  else
    false
  fi
}

########################
# Checks whether a file is empty or not.
# Arguments:
#   $1 - file
# Returns:
#   Boolean
#########################
is_file_empty() {
  local file="${1:?missing file}"

  if [[ -f "${file}" && -s "${file}" ]]; then
    false
  else
    true
  fi
}

########################
# Get the absolute path of the executed script by command substitution.
# Arguments:
#   None
# Returns:
#   Path
#########################
get_sript_dir() {
  local retval
  retval="$(dirname "$(realpath "$0")")"
  echo "${retval}"

  return "${?}"
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
configure_permissions_ownership() {
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
