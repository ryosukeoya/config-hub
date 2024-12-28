#!/usr/bin/env bash
set -euo pipefail

eval "$(ssh-agent)"
ssh-add ~/.ssh/id_ed25519

exit 0
