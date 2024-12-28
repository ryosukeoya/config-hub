#!/usr/bin/env bash
set -euo pipefail

gh issue edit "$1" -b "$(cat /home/ryo/ghq/github.com/plusmedi/sandbox-ryosukeoya/issues/"$1".md)"

exit 0
