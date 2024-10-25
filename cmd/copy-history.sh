#!/usr/bin/env bash

history | cut -c 8- | fzf | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe
