#!/usr/bin/env bash

history | cut -c 8- | fzf | bash
