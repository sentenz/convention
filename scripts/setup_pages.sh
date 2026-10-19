#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Install documentation dependencies into the active Python environment.
set -euo pipefail

python -m pip install -r "$(dirname "${BASH_SOURCE[0]}")/../requirements-docs.txt"
