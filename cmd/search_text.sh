#!/usr/bin/env bash
set -euo pipefail

find . -type f \( -name "*.proto" -o -name "*.sql" \) -exec grep -i -H "$1" {} \; | awk -F: '{print $2 " " $1}' | sort | awk -F: '{print $1 $2}'

exit 0
