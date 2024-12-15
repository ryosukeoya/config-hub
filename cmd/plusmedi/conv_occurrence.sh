#! /usr/bin/env bash

echo $$
echo $PWD
# printenv

# set -euo pipefail
set -o pipefail

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <operation> <path> <option>"
    1 >&2
    echo "Operations: dateTime | timing. operation: $1"
    echo "path: $2"
    echo "option: $3"
    2 >&1
    exit 1
fi

operation="$1"
path="$2"

if [ ! -e "${path}" ]; then
    echo "not exist specified file"
    exit 1
fi

file_base_name=$(basename "${path}")

if [ -f "${path}" ]; then
    file_base_name=$(echo "${file_base_name}" | sed -e 's/\.[^\.]*$//')
fi

file_name=${file_base_name}.json
option="$3"

if [ -z "$file_base_name" ]; then
    echo "file_base_name is empty string" >&2
    exit 1
fi

echo "file_base_name: ${file_base_name}"
echo "file_name: ${file_name}"

output=""

case $option in
# override
"o")
    output=${file_name}
    ;;
"tmp")
    output=tmp/${file_name}
    ;;
*)
    timestamp=$(date +"%Y%m%d_%H%M%S")
    output=${file_base_name}_${timestamp}.json
    ;;
esac

echo "output: ${output}"

# 1回目
jq . "${path}"

case "$operation" in
timing)
    # schedule
    jq '.timing.event[0] = (.Occurrence.Timing.event[0].seconds | todate) |
    .timing.text = (.Occurrence.Timing.text) |
    del(.Occurrence)' "${path}" >tmp.json
    ;;
dateTime)
    # schedule
    jq '.dateTime = (.Occurrence.DateTime.seconds | todate) | del(.Occurrence)' \
        "${path}" >tmp.json
    ;;
wo-authored)
    # waiting order
    jq '.waiting_order.authored = (.waiting_order.authored.seconds | todate)' \
        "${path}" >tmp.json
    ;;
medi-authored)
    # medicine number
    jq '.authored = (.authored.seconds | todate)' \
        "${path}" >tmp.json
    ;;
*)
    echo "Invalid operation: $operation" >&2
    echo "Valid operations: dateTime | timing" >&2
    exit 1
    ;;
esac

content=$(cat ./tmp.json)

if [ "${content}" == "" ]; then
    echo "empty" >&2
    exit 1
fi

# 2回目
echo "${content}" | jq .

if [ ! -d "tmp" ]; then
    mkdir tmp
fi

case "$operation" in
wo-authored)
    # waiting order
    jq '.waiting_order.ibpf_key.timestamp = (.waiting_order.ibpf_key.timestamp.seconds | todate)' ./tmp.json >"./${output}"
    ;;
*)
    jq '.ibpf_key.timestamp = (.ibpf_key.timestamp.seconds | todate)' ./tmp.json >"./${output}"
    ;;
esac

if [ -e "./tmp.json" ]; then
    rm ./tmp.json
fi

# 3回目
jq . "${output}"

echo "Processing complete. Output file: ${output}"
