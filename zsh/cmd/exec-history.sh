#!/usr/bin/env bash
set -euo pipefail

history | cut -c 8- | fzf | bash

exit 0
