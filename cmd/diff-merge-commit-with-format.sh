#!/usr/bin/env bash

git log --merges "$1".."$2" --pretty=format:"%h - %s"

exit 0
