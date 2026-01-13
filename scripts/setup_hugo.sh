#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Setup of the Hugo SSG environment.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "${script_dir}/shell/pkg.sh" ]]; then
  source "${script_dir}/shell/pkg.sh"
fi
if [[ -f "${script_dir}/shell/log.sh" ]]; then
  source "${script_dir}/shell/log.sh"
fi

# Constant Variables

readonly HUGO_VERSION="0.139.3"
readonly HUGO_EXTENDED="hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
readonly HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_EXTENDED}"
readonly INSTALL_DIR="/usr/local/bin"

# Internal Functions

function setup_hugo() {
  local -i retval=0

  echo "Installing Hugo version ${HUGO_VERSION}..."

  # Create temporary directory
  local temp_dir
  temp_dir=$(mktemp -d)
  
  # Download Hugo
  if ! curl -sSL "${HUGO_URL}" -o "${temp_dir}/${HUGO_EXTENDED}"; then
    echo "ERROR: Failed to download Hugo" >&2
    rm -rf "${temp_dir}"
    return 1
  fi

  # Extract Hugo
  if ! tar -xzf "${temp_dir}/${HUGO_EXTENDED}" -C "${temp_dir}"; then
    echo "ERROR: Failed to extract Hugo" >&2
    rm -rf "${temp_dir}"
    return 1
  fi

  # Install Hugo (requires sudo)
  if [[ -w "${INSTALL_DIR}" ]]; then
    mv "${temp_dir}/hugo" "${INSTALL_DIR}/hugo"
    ((retval |= $?))
  else
    sudo mv "${temp_dir}/hugo" "${INSTALL_DIR}/hugo"
    ((retval |= $?))
  fi

  # Cleanup
  rm -rf "${temp_dir}"

  # Verify installation
  if command -v hugo &>/dev/null; then
    echo "Hugo installed successfully: $(hugo version)"
  else
    echo "ERROR: Hugo installation failed" >&2
    return 1
  fi

  return "${retval}"
}

# Control Flow Logic

setup_hugo
exit "${?}"

