#!/usr/bin/env bash
set -euo pipefail

for v in "$@"; do
  gh browse "$v"
done

exit 0
