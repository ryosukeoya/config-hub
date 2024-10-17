#!/usr/bin/env bash

git tag --sort -v:refname | grep $1 | fzf | tr -d '\n' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe
