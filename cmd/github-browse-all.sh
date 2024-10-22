#!/usr/bin/env bash

for v in "$@"; do
  gh browse "$v"
done
