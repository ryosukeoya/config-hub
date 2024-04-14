#!/bin/bash

backup_dir=/mnt/c/Users/大屋諒恭/Documents/backup
zip -r "${backup_dir}/$1-backup-$(date +'%Y-%m-%d-%d-%d').zip" ./*
