#!/usr/bin/env bash

filename="$(date "+%Y-%m")"

# c: Current Directory
if [ "$1" = 'c' ]; then
  filename+="-$(basename "${PWD}")"
elif [ -n "$1" ]; then
  filename+="-$1"
fi

ex='md'
[ -n "$2" ] && ex="$2"

touch "${filename}.${ex}"

exit 0
