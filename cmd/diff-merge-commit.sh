#!/usr/bin/env bash
set -euo pipefail

git log --merges --oneline "$1".."$2"

exit 0
