#!/usr/bin/env bash

history | cut -c 8- | fzf | bash

exit 0
