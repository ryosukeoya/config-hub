#!/usr/bin/env bash
set -euo pipefail

find /home/ryo/ghq/github.com/plusmedi/mhv2-backends -name "go.mod" -type f -exec grep -nH --null -e "$1" \{\} +

exit 0
