#! /usr/bin/env bash

echo $$
# echo "${PWD}"
printenv

dir_name=$1

files=$(ls "${dir_name}")

operation=""

for file in $files; do
    ex=${file##*.}
    if [ ! "${ex}" = 'json' ]; then
        continue
    fi

    path=${dir_name}/${file}
    hasDateTime=$(jq 'has(".dateTime")' "${path}")
    if [ "${hasDateTime}" ]; then
        operation=dateTime
    else
        operation=timing
    fi
    # /home/ryo/ghq/github.com/ryosukeoya/zsh/cmd/plusmedi/conv_occurrence.sh "${operation}" "${path}" "tmp" 2>>error.log
    /home/ryo/ghq/github.com/ryosukeoya/zsh/cmd/plusmedi/conv_occurrence.sh "wo-authored" "${path}" "tmp" 2>>error.log
done

echo "" >>error.log
