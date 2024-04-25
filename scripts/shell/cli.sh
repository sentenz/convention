#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Library for cli actions.

source "$(dirname "${BASH_SOURCE[0]}")/util.sh"

########################
# Checks if the commit messages meet the conventional commit format.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_commitlint() {
  local file="${1:?file is missing}"

  commitlint --edit "${file}"
}

########################
# Git commit message linter checks commit messages for style.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_gitlint() {
  local file="${1:?file is missing}"

  gitlint--msg-filename "${file}"
}

########################
# A static analysis tool with suggestions for bash/sh scripts.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_shellcheck() {
  local file="${1:?file is missing}"

  shellcheck -s bash "${file}"
}

########################
# Catch insensitive, inconsiderate writing.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_alex() {
  local file="${1:?file is missing}"

  alex --quiet "${file}"
}

########################
# A tool to format C/C++/Java/JavaScript/JSON/Objective-C/Protobuf/C# code.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_clang_format() {
  local file="${1:?file is missing}"

  clang-format --dry-run "${file}"
}

########################
# Check code for common misspellings.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_codespell() {
  local file="${1:?file is missing}"

  codespell "${file}"
}

########################
# A clang-based C++ static analysis tool to fixing typical programming errors, style violations,
# interface misuse.
# Arguments:
#   $1 - file
#   $2 - database
# Returns:
#   $? - Result
#########################
function cli_clang_tidy() {
  local file="${1:?file is missing}"
  local database="${2:-}"

  clang-tidy --fix -p="${database}" "${file}"
}

########################
# Static analysis of C/C++ code.
# Arguments:
#   $1 - file
#   $2 - resource
# Returns:
#   $? - Result
#########################
function cli_cppcheck() {
  local file="${1:?file is missing}"
  local resource="${2:-}"

  if util_string_exist "${resource}"; then
    cppcheck --enable=warning --suppressions-list="${resource}" --template='[{file}:{line}]:({severity}),{id},{message}' --force -q "${file}"
  else
    cppcheck --enable=warning --template='[{file}:{line}]:({severity}),{id},{message}' --force -q "${file}"
  fi
}

########################
# Static nalysis of C/C++ files for style issues following Google's C++ style guide.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_cpplint() {
  local file="${1:?file is missing}"

  cpplint --quiet "${file}"
}

########################
# An opinionated Dockerfile linter for common traps, mistakes and helps enforce best practices.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_dockerfilelint() {
  local file="${1:?file is missing}"

  dockerfilelint "${file}"
}

########################
# A fast Go linters runner.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_golangci_lint() {
  local file="${1:?file is missing}"

  # FIXME(AK) https://github.com/actions/setup-go/issues/14
  export PATH="${HOME}"/go/bin:/usr/local/go/bin:"${PATH}"

  golangci-lint run --fast "${file}"
}

########################
# A JSON parser and validator.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_jsonlint() {
  local file="${1:?file is missing}"

  jsonlint --quiet -p -c "${file}"
}

########################
# A license checker for source files.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_licensecheck() {
  local file="${1:?file is missing}"

  licensecheck --copyright --deb-machine --lines 0 "${file}"
}

########################
# Checks that all of the hyperlinks in a markdown text to determine if they are alive or dead.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_markdown_link_check() {
  local file="${1:?file is missing}"

  markdown-link-check -r --quiet "${file}"
}

########################
# A fast, flexible, configuration-based command-line interface for linting Markdown/CommonMark
# files with the markdownlint library.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_markdownlint_cli2() {
  local file="${1:?file is missing}"

  markdownlint-cli2 "${file}"
}

########################
# An opinionated code formatter.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_prettier() {
  local file="${1:?file is missing}"

  prettier -l "${file}"
}

########################
# A linter for prose.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_proselint() {
  local file="${1:?file is missing}"

  proselint "${file}"
}

########################
# A shell parser, formatter, and interpreter with bash support.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_shfmt() {
  local file="${1:?file is missing}"

  shfmt -d -i 2 -ci "${file}"
}

########################
# A shell parser, formatter, and interpreter with bash support.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_write_good() {
  local file="${1:?file is missing}"

  write-good --parse "${file}"
}

########################
# A linter for YAML files.
# Arguments:
#   $1 - file
# Returns:
#   $? - Result
#########################
function cli_yamllint() {
  local file="${1:?file is missing}"

  yamllint -s "${file}"
}

########################
# An instrumentation framework for building dynamic analysis tools.
# Arguments:
#   $1 - executable
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_valgrind() {
  local executable="${1:?executable is missing}"
  local log="${2:-}"

  util_dir_create "${log}"

  if util_string_exist "${log}"; then
    valgrind --log-file="${log}" "${executable}"
  else
    valgrind "${executable}"
  fi
}

########################
# Generating a SBOM from container images and filesystems.
# Arguments:
#   $1 - path
#   $2 - regex pattern
#   $3 - log file
# Returns:
#   $? - Result
#########################
function cli_sbommerge() {
  local path="${1:?path is missing}"
  local pattern="${2:?pattern is missing}"
  local log="${3:?log is missing}"

  # Find all the SBOM files in the path and store them in an array
  local -a files=($(find "${path}" -name "${pattern}"))
  # Check if there are at least two files to merge
  if [ ${#files[@]} -lt 2 ]; then
    return 1
  fi

  # Use the first file as the initial output file
  util_file_create "${log}"
  cp "${files[0]}" "${log}"

  # FIXME(ALKL) Resolve a SBOM merge even woth only one file
  # Loop through the rest of the files and merge them with the output file
  for ((i = 1; i < ${#files[@]}; i++)); do
    sbommerge --sbom-type spdx --format json --output-file "${log}" "${files[$i]}" "${log}"
  done

  return 0
}

########################
# Generating a SBOM from container images and filesystems.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_syft() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  syft --quiet --output spdx="${log}" "${path}"
}

########################
# A SBOM vulnerability scanner for container images and filesystems.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_grype_sbom() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  grype --quiet --file "${log}" sbom:"${path}"
}

########################
# Find OS packages and software dependencies with SBOM in containers, Kubernetes, code
# repositories, and clouds.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --no-progress --format spdx-json --output "${log}" "${path}"
}

########################
# Scan SBOM for vulnerabilities.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_sbom() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet sbom --quiet --no-progress --output "${log}" "${path}"
}

########################
# Scans filesystem for license compliance.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_license() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners license --license-full --output "${log}" "${path}"
}

########################
# Scan filesystem for secrets.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_secret() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners secret --output "${log}" "${path}"
}

########################
# Scan filesystem for vulnerabilities.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_vulnerability() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners vuln --output "${log}" "${path}"
}

########################
# Scan configuration for vulnerabilities and misconfiguration.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_config() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet config --quiet --output "${log}" "${path}"
}

########################
# Scan rootfs for vulnerabilities and secrets.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_rootfs() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet rootfs --quiet --no-progress --scanners vuln,secret --output "${log}" "${path}"
}

########################
# Scan image for vulnerabilities, misconfiguration, secrets, and license compliance.
# Arguments:
#   $1 - image
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_image() {
  local image="${1:?image is missing}"
  local log="${2:?log is missing}"
  local template="${3:-}"

  util_dir_create "${log}"

  if util_string_exist "${template}"; then
    trivy --quiet image --quiet --no-progress --format template --template "@${template}" --output "${log}" "${image}"
  else
    trivy --quiet image --quiet --no-progress --scanners vuln,misconfig,secret,license --output "${log}" "${image}"
  fi
}

########################
# Generate SBOM from container images.
# Arguments:
#   $1 - image
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_image_sbom() {
  local image="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet image --quiet --no-progress --format spdx-json --output "${log}" "${image}"
}

########################
# Scan repository for vulnerabilities, misconfiguration, secrets, and license compliance.
# Arguments:
#   $1 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_trivy_repo() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet repo --quiet --scanners vuln,misconfig,secret,license --output "${log}" "${path}"
}

########################
# Automated version management.
# Arguments:
#   None
# Returns:
#   $? - Result - verion tag, CHANGELOG.md
#########################
function cli_semantic_release() {
  npx semantic-release
}

########################
# LCOV is an extension of GCOV, a GNU tool which provides information about code coverage.
# Arguments:
#   $1 - executable
#   $2 - path
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_lcov() {
  local executable="${1:?executable is missing}"
  local path="${2:?path is missing}"
  local log="${3:?log is missing}"

  local dir
  dir=$(util_dir_create "${log}")

  if util_string_exist "${executable}"; then
    "${executable}"
  fi

  lcov --capture --directory "${path}" --output-file "${log}"
  genhtml "${log}" --output-directory "${dir}"
}

########################
# gcovr generates code coverage reports with gcc/gcov.
# Arguments:
#   $1 - executable
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_gcovr() {
  local executable="${1:-}"
  local log="${2:?log is missing}"

  local dir
  dir=$(util_dir_create "${log}")

  if util_string_exist "${executable}"; then
    "${executable}"
  fi

  gcovr --xml-pretty --output "${log}" --html="${dir}/"
}

########################
# Sanitizer using AddressSanitizer (ASan) and UndefinedBehaviorSanitizer (UBSan).
# Arguments:
#   $1 - executable
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_sanitizer() {
  local executable="${1:?executable is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  "${executable}" 2>"${log}"
}

########################
# GoogleTest (GTest) is a C++ testing and mocking framework.
# Arguments:
#   $1 - executable
#   $2 - log file
# Returns:
#   $? - Result
#########################
function cli_gtest() {
  local executable="${1:?executable is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  "${executable}" --gtest_output=xml:"${log}"
}
