#!/usr/bin/env bash

backup_dir='/mnt/c/Users/大屋諒恭/OneDrive - Baleen Studio/ドキュメント/backup'
dir="$1"

zip -r "${backup_dir}/${dir}/backup-$(date +'%Y-%m-%d').zip" ./*

exit 0
