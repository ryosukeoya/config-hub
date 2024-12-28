#!/usr/bin/env bash
set -euo pipefail

diff_files=$(git diff --name-only HEAD)

git add .
git commit -m "upsert ${diff_files}"
git push origin HEAD

exit 0
