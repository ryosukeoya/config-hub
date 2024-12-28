#!/usr/bin/env bash
set -euo pipefail

diff_file=$(git diff --name-only "$1" "$2" | fzf)
git diff "$1" "$2" -- "/home/ryo/ghq/github.com/plusmedi/mhv2-backends/${diff_file}"

exit 0
