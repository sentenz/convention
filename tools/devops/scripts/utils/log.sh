#!/bin/bash
#
# Library for logging actions.

# Color palette
readonly RESET='\033[0m'
readonly GREEN='\033[38;5;2m'
readonly RED='\033[38;5;1m'
readonly YELLOW='\033[38;5;3m'
readonly WHITE='\033[38;5;7m'
DATE="[$(date +'%Y-%m-%dT%H:%M:%S%z')]"
readonly DATE

export STATUS_SUCCESS=0
export STATUS_ERROR=1
export STATUS_WARNING=2
export STATUS_SKIP=255

# Functions

########################
# Log message to stderr.
# Arguments:
#   $1 - Message to log
#########################
log() {
  printf "%b\\n" "${*}" >&2
}

########################
# Log skipped message.
# Arguments:
#   $1 - Message to log
#########################
skip() {
  log "${DATE} ${WHITE}SKIP ${RESET}\t" "${*}"
}

########################
# Log pass message.
# Arguments:
#   $1 - Message to log
#########################
pass() {
  log "${DATE} ${GREEN}PASS ${RESET}\t" "${*}"
}

########################
# Log warning message.
# Arguments:
#   $1 - Message to log
#########################
warn() {
  log "${DATE} ${YELLOW}WARN ${RESET}\t" "${*}"
}

########################
# Log error message.
# Arguments:
#   $1 - Message to log
#########################
error() {
  log "${DATE} ${RED}ERROR ${RESET}\t" "${*}"
}

########################
# Monitor logging message.
# Arguments:
#   $1 - Task is running
#   $2 - Performed package
#   $3 - Status of the package
# Returns:
#   None
#########################
monitor() {
  local task="${1:?task is missing}"
  local package="${2:?package is missing}"
  local status="${3:?status is missing}"

  if ((status == STATUS_SUCCESS)); then
    pass "[${task}] ${package}"
  elif ((status == STATUS_SKIP)); then
    skip "[${task}] ${package}"
  elif ((status == STATUS_WARNING)); then
    warn "[${task}] ${package}"
  elif ((status == STATUS_ERROR)); then
    error "[${task}] ${package}"
  else
    error "[${task}] ${package} unknown status code: ${status}"
  fi
}
