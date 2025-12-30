#!/bin/bash
#
# Library for cli actions.

source "$(dirname "${BASH_SOURCE[0]}")/util.sh"

# Checks if the commit messages meet the conventional commit format.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_commitlint() {
  local filepath="${1:?filepath is missing}"

  commitlint --edit "${filepath}"
}

# A static analysis tool with suggestions for bash/sh scripts.
#
# Arguments:
#   $1 - filepath
#   $2 - logfile
# Returns:
#   $? - Result
function cli_shellcheck() {
  local filepath="${1:-.}"
  local output="${2:-}"

  util_dir_create "${output}"

  local -i retval=0

  if util_dir_exist "${filepath}"; then
    # Find all .sh files and output ShellCheck results in JSON
    if [[ -n "${output}" ]]; then
      find "${filepath}" -name "*.sh" -type f -exec shellcheck -s bash -f json {} + >"${output}"
      ((retval |= $?))
    else
      find "${filepath}" -name "*.sh" -type f -exec shellcheck -s bash -f json {} +
      ((retval |= $?))
    fi
  else
    # Run ShellCheck on a single file and output in JSON
    if [[ -n "${output}" ]]; then
      shellcheck -s bash -f json "${filepath}" >"${output}"
      ((retval |= $?))
    else
      shellcheck -s bash -f json "${filepath}"
      ((retval |= $?))
    fi
  fi

  return "${retval}"
}

# Formats and checks shell scripts according to shell formatting guidelines.
#
# Globals:
#   None
# Arguments:
#   $1 (optional) - filepath: Path to a file or directory containing shell scripts. Defaults to the current directory.
#   $2 (optional) - output: Path to the log file where errors and warnings will be stored.
# Outputs:
#   Logs any formatting issues or errors to the specified log file.
# Returns:
#   0: Successful execution without formatting issues.
#   1: Formatting issues found.
function cli_shfmt() {
  local filepath="${1:-.}"
  local output="${2:-}"

  util_dir_create "${output}"

  local -i retval=0

  if util_dir_exist "${filepath}"; then
    # Find all .sh files and output ShellCheck results in JSON
    if [[ -n "${output}" ]]; then
      find "${filepath}" -name "*.sh" -type f -exec shfmt -d -i 2 -ci {} + >"${output}"
      ((retval |= $?))
    else
      find "${filepath}" -name "*.sh" -type f -exec shfmt -d -i 2 -ci {} +
      ((retval |= $?))
    fi
  else
    # Run ShellCheck on a single file and output in JSON
    if [[ -n "${output}" ]]; then
      shfmt -d -i 2 -ci "${filepath}" >"${output}"
      ((retval |= $?))
    else
      shfmt -d -i 2 -ci "${filepath}"
      ((retval |= $?))
    fi
  fi

  return "${retval}"
}

# Catch insensitive, inconsiderate writing.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_alex() {
  local filepath="${1:?filepath is missing}"

  alex --quiet "${filepath}"
}

# A tool to format C/C++/Java/JavaScript/JSON/Objective-C/Protobuf/C# code.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_clang_format() {
  local filepath="${1:?filepath is missing}"

  clang-format --dry-run "${filepath}"
}

# Check code for common misspellings.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_codespell() {
  local filepath="${1:?filepath is missing}"

  codespell "${filepath}"
}

# A clang-based C++ static analysis tool to fixing typical programming errors, style violations,
# interface misuse.
#
# Arguments:
#   $1 - filepath
#   $2 - database
# Returns:
#   $? - Result
function cli_clang_tidy() {
  local filepath="${1:?filepath is missing}"
  local database="${2:-}"

  clang-tidy --fix -p="${database}" "${filepath}"
}

# Static analysis of C/C++ code.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_cppcheck() {
  local filepath="${1:-.}"

  local -i retval=0

  cppcheck --enable=all --library=posix --quiet "${filepath}" 2>&1
  ((retval |= $?))
}

# Static analysis of C/C++ files for style issues following Google's C++ style guide.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_cpplint() {
  local filepath="${1:?filepath is missing}"

  cpplint --quiet "${filepath}"
}

# An opinionated Dockerfile linter for common traps, mistakes and helps enforce best practices.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_dockerfilelint() {
  local filepath="${1:?filepath is missing}"

  dockerfilelint "${filepath}"
}

# A fast Go linters runner.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_golangci_lint() {
  local filepath="${1:?filepath is missing}"

  # FIXME https://github.com/actions/setup-go/issues/14
  export PATH="${HOME}"/go/bin:/usr/local/go/bin:"${PATH}"

  golangci-lint run --fast "${filepath}"
}

# A JSON parser and validator.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_jsonlint() {
  local filepath="${1:?filepath is missing}"

  jsonlint --quiet -p -c "${filepath}"
}

# A license checker for source files.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_licensecheck() {
  local filepath="${1:?filepath is missing}"

  licensecheck --copyright --deb-machine --lines 0 "${filepath}"
}

# Checks that all of the hyperlinks in a markdown text to determine if they are alive or dead.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_markdown_link_check() {
  local filepath="${1:?filepath is missing}"

  markdown-link-check -r --quiet "${filepath}"
}

# A fast, flexible, configuration-based command-line interface for linting Markdown/CommonMark
# files with the markdownlint library.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_markdownlint_cli2() {
  local filepath="${1:?filepath is missing}"

  markdownlint-cli2 "${filepath}"
}

# An opinionated code formatter.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_prettier() {
  local filepath="${1:?filepath is missing}"

  prettier -l "${filepath}"
}

# A linter for prose.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_proselint() {
  local filepath="${1:?filepath is missing}"

  proselint "${filepath}"
}

# A shell parser, formatter, and interpreter with bash support.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_write_good() {
  local filepath="${1:?filepath is missing}"

  write-good --parse "${filepath}"
}

# A linter for YAML files.
#
# Arguments:
#   $1 - filepath
# Returns:
#   $? - Result
function cli_yamllint() {
  local filepath="${1:?filepath is missing}"

  yamllint -s "${filepath}"
}

# An instrumentation framework for building dynamic analysis tools.
#
# Arguments:
#   $1 - executable
#   $2 - log filepath
# Returns:
#   $? - Result
function cli_valgrind() {
  local executable="${1:?executable is missing}"
  local log="${2:-}"

  util_dir_create "${log}"

  if util_string_exist "${log}"; then
    valgrind --log-filepath="${log}" "${executable}"
  else
    valgrind "${executable}"
  fi
}

# Generating a SBOM from container images and filesystems.
#
# Arguments:
#   $1 - path
#   $2 - regex pattern
#   $3 - logfile
# Returns:
#   $? - Result
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

  # FIXME Resolve a SBOM merge even woth only one file
  # Loop through the rest of the files and merge them with the output file
  for ((i = 1; i < ${#files[@]}; i++)); do
    sbommerge --sbom-type spdx --format json --output-file "${log}" "${files[$i]}" "${log}"
  done

  return 0
}

# Generating a SBOM from container images and filesystems.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_syft() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  syft --quiet --output spdx="${log}" "${path}"
}

# A SBOM vulnerability scanner for container images and filesystems.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_grype_sbom() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  grype --quiet --file "${log}" sbom:"${path}"
}

# Find OS packages and software dependencies with SBOM in containers, Kubernetes, code
# repositories, and clouds.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --no-progress --format spdx --output "${log}" "${path}"
}

# Scan SBOM for vulnerabilities.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_sbom() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet sbom --quiet --no-progress --output "${log}" "${path}"
}

# Scans filesystem for license compliance.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_license() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners license --license-full --output "${log}" "${path}"
}

# Scan filesystem for secrets.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_secret() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners secret --output "${log}" "${path}"
}

# Scan filesystem for vulnerabilities.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_vulnerability() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet filesystem --quiet --no-progress --scanners vuln --output "${log}" "${path}"
}

# Scan configuration for vulnerabilities and misconfiguration.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_config() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet config --quiet --no-progress --output "${log}" "${path}"
}

# Scan rootfs for vulnerabilities and secrets.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_rootfs() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet rootfs --quiet --no-progress --scanners vuln,secret --output "${log}" "${path}"
}

# Scan image for vulnerabilities, misconfiguration, secrets, and license compliance.
#
# Arguments:
#   $1 - image
#   $2 - logfile
# Returns:
#   $? - Result
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

# Generate SBOM from container images.
#
# Arguments:
#   $1 - image
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_image_sbom() {
  local image="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet image --quiet --no-progress --format spdx-json --output "${log}" "${image}"
}

# Scan repository for vulnerabilities, misconfiguration, secrets, and license compliance.
#
# Arguments:
#   $1 - path
#   $2 - logfile
# Returns:
#   $? - Result
function cli_trivy_repo() {
  local path="${1:?path is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  trivy --quiet repo --quiet --scanners vuln,misconfig,secret,license --output "${log}" "${path}"
}

# Automated version management.
#
# Arguments:
#   None
# Returns:
#   $? - Result - verion tag, CHANGELOG.md
function cli_semantic_release() {
  npx semantic-release
}

# LCOV is an extension of GCOV, a GNU tool which provides information about code coverage.
#
# Arguments:
#   $1 - executable
#   $2 - path
#   $2 - logfile
# Returns:
#   $? - Result
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

# gcovr generates code coverage reports with gcc/gcov.
#
# Arguments:
#   $1 - executable
#   $2 - logfile
# Returns:
#   $? - Result
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

# Sanitizer using AddressSanitizer (ASan) and UndefinedBehaviorSanitizer (UBSan).
#
# Arguments:
#   $1 - executable
#   $2 - logfile
# Returns:
#   $? - Result
function cli_sanitizer() {
  local executable="${1:?executable is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  "${executable}" 2>"${log}"
}

# GoogleTest (GTest) is a C++ testing and mocking framework.
#
# Arguments:
#   $1 - executable
#   $2 - logfile
# Returns:
#   $? - Result
function cli_gtest() {
  local executable="${1:?executable is missing}"
  local log="${2:?log is missing}"

  util_dir_create "${log}"

  "${executable}" --gtest_output=xml:"${log}"
}

# Semgrep CLI scans code for bugs, security and dependency vulnerabilities.
#
# Globals:
#   None
# Arguments:
#   $1 (optional) - filepath: Path to a file or directory containing shell scripts. Defaults to the current directory.
#   $2 (optional) - output_file: Write output to a file. Default is to print to stdout.
# Outputs:
#   Logs any formatting issues or errors to the specified log file.
# Returns:
#   0: On success.
#   1: On vulnerability findings.
function cli_semgrep() {
  local filepath="${1:-.}"
  local output_file="${2:-}"

  util_dir_create "${output_file}"

  semgrep scan -q --no-secrets-validation --metrics "off" --gitlab-sast --gitlab-sast-output "gl-sast-report.json" --config "p/default" --config ".semgrep.yml" "${filepath}"
  if [[ -f "gl-sast-report.json" ]]; then
    if ! grep -q '"vulnerabilities":\[\]' gl-sast-report.json; then
      exit 1
    fi
  fi
}

# Gitleaks detects secrets like passwords, API keys, and tokens in git repos and files.
#
# Globals:
#   None
# Arguments:
#   $1 (optional) - filepath: Path to a file or directory containing shell scripts. Defaults to the current directory.
#   $2 (optional) - output_file: Write output to a file. Default is to print to stdout.
# Outputs:
#   Logs any formatting issues or errors to the specified log file.
# Returns:
#   0: No leaks present.
#   1: Leaks or error encountered.
#   126: Unknown flag.
function cli_gitleaks() {
  local filepath="${1:-.}"
  local output_file="${2:--}"

  util_dir_create "${output_file}"

  gitleaks dir "${filepath}" --redact --report-format=json --report-path="${output_file}"
}

# ansible-lint checks Ansible playbooks and roles against best practices
# and common pitfalls, ensuring that the content adheres to recommended standards.
#
# Globals:
#   None
# Arguments:
#   $1 (optional) - filepath: Path to a file or directory containing Ansible playbooks or roles. Defaults to the current directory.
#   $2 (optional) - output_file: File to which the linting output is written. Default is to print to stdout.
# Outputs:
#   Records any linting issues or errors to the specified log file.
# Returns:
#   0: No linting issues found.
#   1: Linting issues encountered or error occurred.
#   126: Unknown flag.
function cli_ansible_lint() {
  local filepath="${1:-.}"
  local output_file="${2:-}"

  util_dir_create "${output_file}"

  local -i retval=0

  if util_dir_exist "${filepath}"; then
    if [[ -n "${output_file}" ]]; then
      find "${filepath}" \( -name "*.yml" -o -name "*.yaml" \) -not -path "*/.ansible/*" -type f -exec ansible-lint -q -f codeclimate {} + >"${output_file}"
      ((retval |= $?))
    else
      find "${filepath}" \( -name "*.yml" -o -name "*.yaml" \) -not -path "*/.ansible/*" -type f -exec ansible-lint -q -f codeclimate {} +
      ((retval |= $?))
    fi
  else
    if [[ -n "${output_file}" ]]; then
      ansible-lint -q -f codeclimate "${filepath}" >"${output_file}"
      ((retval |= $?))
    else
      ansible-lint -q -f codeclimate "${filepath}"
      ((retval |= $?))
    fi
  fi

  return "${retval}"
}
