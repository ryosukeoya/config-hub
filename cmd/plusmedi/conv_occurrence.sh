#! /usr/bin/env bash

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <file_base_name> <operation> <option>"
    echo "Operations: dateTime | timing" >&2
fi

operation="$1"
file_base_name="$2"
option="$3"

file_name=${file_base_name}.json
new_file_name=""

case $option in
# override
"o")
    new_file_name=${file_name}
    ;;
*)
    timestamp=$(date +"%Y%m%d_%H%M%S")
    new_file_name=${file_base_name}_${timestamp}.json
    ;;
esac

jq . "${file_name}"

case "$operation" in
timing)
    jq '.timing.event[0] = (.Occurrence.Timing.event[0].seconds | todate) |
    .timing.text = (.Occurrence.Timing.text) |
    del(.Occurrence)' \
        "${file_name}" >tmp.json && mv tmp.json "${new_file_name}"
    ;;
dateTime)
    jq '.dateTime = (.Occurrence.DateTime.seconds | todate) | del(.Occurrence)' \
        "${file_name}" >tmp.json && mv tmp.json "${new_file_name}"
    ;;
*)
    echo "Invalid operation: $operation"
    echo "Valid operations: timing | dateTime" >&2
    ;;
esac

jq '.ibpf_key.timestamp = (.ibpf_key.timestamp.seconds | todate)' "${new_file_name}" >tmp.json && mv tmp.json "${new_file_name}"
jq . "${new_file_name}"

echo "Processing complete. Output file: ${new_file_name}"
