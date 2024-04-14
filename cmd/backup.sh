#!/bin/bash

backup_dir=/mnt/c/Users/大屋諒恭/Documents/backup
[ -n "$1" ] && prefix="$1-" || prefix=''
zip -r "${backup_dir}/${prefix}backup-$(date +'%Y-%m-%d').zip" ./*
