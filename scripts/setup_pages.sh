#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Setup of the SSG Pages environment.

# -x: print a trace (debug)
# -u: treat unset variables
# -o pipefail: return value of a pipeline
set -uo pipefail

# Include Scripts

source ./../scripts/shell/pkg.sh

# Internal Functions

function setup_pages() {
  local -i retval=0

  # Install GitBook CLI and plugins via npm
  if command -v npm &> /dev/null; then
    echo "Installing GitBook CLI and dependencies..."
    npm install
    ((retval |= $?))
    
    # Install GitBook plugins
    npx gitbook install
    ((retval |= $?))
  else
    echo "Error: npm is not installed. Please install Node.js and npm first."
    return 1
  fi

  return "${retval}"
}

# Control Flow Logic

setup_pages
exit "${?}"
