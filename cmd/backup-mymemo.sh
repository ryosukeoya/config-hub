#!/usr/bin/env bash

backup_dir='/mnt/c/Users/大屋諒恭/OneDrive\ -\ Baleen Studio/ドキュメント/backup'
my_memo_dirs="$(find ~/ -name my_memo.md | tr '\n' ' ')"

echo "${backup_dir}/my_memo/backup-$(date +'%Y-%m-%d').zip" "${my_memo_dirs}" | xargs zip
