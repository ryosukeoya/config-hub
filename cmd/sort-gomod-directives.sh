#!/usr/bin/env bash
set -euo pipefail

find_dir=$1

find "${find_dir}" -name "go.mod" -type f -exec grep -nH --null -e ^go \{\} + | sort -t ' ' -k 2 -V -r

exit 0
