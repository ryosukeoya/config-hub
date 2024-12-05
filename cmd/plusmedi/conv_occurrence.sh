#! /usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <operation> <path> <option>"
    echo "Operations: dateTime | timing" >&2
fi

operation="$1"
path="$2"
file_base_name=$(basename "${path}" .json)
file_name=${file_base_name}.json
option="$3"

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

jq . "${path}"

case "$operation" in
timing)
    jq '.timing.event[0] = (.Occurrence.Timing.event[0].seconds | todate) |
    .timing.text = (.Occurrence.Timing.text) |
    del(.Occurrence)' \
        "${path}" >tmp.json && mv tmp.json "${output}"
    ;;
dateTime)
    jq '.dateTime = (.Occurrence.DateTime.seconds | todate) | del(.Occurrence)' \
        "${path}" >tmp.json && mv tmp.json "${output}"
    ;;
*)
    echo "Invalid operation: $operation"
    echo "Valid operations: timing | dateTime" >&2
    ;;
esac

jq '.ibpf_key.timestamp = (.ibpf_key.timestamp.seconds | todate)' "${output}" >tmp.json && mv tmp.json "${output}"
jq . "${output}"

echo "Processing complete. Output file: ${output}"
