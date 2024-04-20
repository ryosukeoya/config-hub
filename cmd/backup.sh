#!/bin/bash

backup_dir='/mnt/c/Users/大屋諒恭/OneDrive - Baleen Studio/ドキュメント/backup'
[ -n "$1" ] && dir="$1-" || dir=''
zip -r "${backup_dir}/${dir}/backup-$(date +'%Y-%m-%d').zip" ./*
