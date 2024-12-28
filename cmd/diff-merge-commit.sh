#!/usr/bin/env bash

git log --merges --oneline "$1".."$2"

exit 0
