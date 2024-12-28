#!/usr/bin/env bash
set -euo pipefail

history | cut -c 8- | fzf | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe

exit 0
