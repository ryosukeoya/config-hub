#!/usr/bin/env bash

find /home/ryo/ghq/github.com/plusmedi/mhv2-backends -name "go.mod" -type f -exec grep -nH --null -e ^go \{\} + | sort -t ' ' -k 2 -V -r

# find /home/ryo/ghq/github.com/plusmedi/mhv2-backends -name "go.mod" -type f -exec grep -nH --null -e ^go \{\} + | sort -t ' ' -k 2 -V -r | awk '{
#     version=$2
#     printf "%s %s\033[34m%s\033[0m\n", $1, "go", version
# }'

exit 0
