#!/usr/bin/env bash
set -euo pipefail

git diff --name-only "$1" "$2"

exit 0
