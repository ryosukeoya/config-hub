#!/usr/bin/env bash
set -euo pipefail

git log --merges "$1".."$2" --pretty=format:"%h - %s"

exit 0
