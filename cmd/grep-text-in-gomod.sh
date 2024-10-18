#!/usr/bin/env bash

find /home/ryo/ghq/github.com/plusmedi/mhv2-backends -name "go.mod" -type f -exec grep -nH --null -e "$1" \{\} +
