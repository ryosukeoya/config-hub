#!/usr/bin/env bash
set -euo pipefail

# git log --oneline | fzf | grep -o '\[.*\]' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe
git log --oneline | fzf | sed 's/.*\[\([^]]*\)\].*/\1/' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe

exit 0
