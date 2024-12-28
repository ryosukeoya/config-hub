#!/usr/bin/env bash
set -euo pipefail

git tag --sort -v:refname | grep "$1" | head -n 10

exit 0
