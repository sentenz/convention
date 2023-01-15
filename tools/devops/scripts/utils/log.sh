#!/bin/bash
#
# Library for logging actions.

# A color init string consists of one or more of the following numeric codes:
# - Attribute codes:
#   00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# - Text color codes:
#   30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# - Background color codes:
#   40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
# - Extended color codes for terminals that support more than 16 colors:
#   (the above color codes still work for these terminals)
#   - Text color coding:
#     38;5;COLOR_NUMBER
#   - Background color coding:
#     48;5;COLOR_NUMBER
#   COLOR_NUMBER is from 0 to 255.
#
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt

# Formats
readonly RESET='\033[0m'

# Regular Colors
# readonly BLACK='\033[38;5;0m'
# readonly BLUE='\033[38;5;4m'
# readonly RED='\033[38;5;1m'
# readonly GREEN='\033[38;5;2m'
# readonly YELLOW='\033[38;5;3m'
# readonly WHITE='\033[38;5;7m'

# High Intensty
# readonly INTENS_BLACK='\033[38;5;8m'
readonly INTENS_BLUE='\033[38;5;12m'
readonly INTENS_RED='\033[38;5;9m'
readonly INTENS_GREEN='\033[38;5;10m'
readonly INTENS_YELLOW='\033[38;5;11m'
readonly INTENS_WHITE='\033[38;5;15m'

# Status Codes
export STATUS_SUCCESS=0
export STATUS_ERROR=1
export STATUS_WARNING=2
export STATUS_SKIP=255

DATE="$(date +'%Y-%m-%dT%H:%M:%S%z')"
readonly DATE

# Functions

########################
# Log message to stderr.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_print() {
  printf "%b\\n" "${*}" >&2
}

########################
# Log info message.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_info() {
  log_print "${DATE}\t ${INTENS_BLUE}info ${RESET}\t" "${*}"
}

########################
# Log skipped message.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_skip() {
  log_print "${DATE}\t ${INTENS_WHITE}skipped ${RESET}\t" "${*}"
}

########################
# Log pass message.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_pass() {
  log_print "${DATE}\t ${INTENS_GREEN}passed ${RESET}\t" "${*}"
}

########################
# Log warning message.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_warn() {
  log_print "${DATE}\t ${INTENS_YELLOW}warning ${RESET}\t" "${*}"
}

########################
# Log error message.
# Arguments:
#   $1 - Message to log
# Returns:
#   Name
#########################
log_error() {
  log_print "${DATE}\t ${INTENS_RED}failed ${RESET}\t" "${*}"
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
log_message() {
  local task="${1:?task is missing}"
  local package="${2:?package is missing}"
  local status="${3:?status is missing}"

  if ((status == STATUS_SUCCESS)); then
    log_pass "[${task}] ${package}"
  elif ((status == STATUS_SKIP)); then
    log_skip "[${task}] ${package}"
  elif ((status == STATUS_WARNING)); then
    log_warn "[${task}] ${package}"
  elif ((status == STATUS_ERROR)); then
    log_error "[${task}] ${package}"
  else
    log_error "[${task}] ${package} unknown status code: ${status}"
  fi
}
