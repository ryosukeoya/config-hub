#! /usr/bin/env bash

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <file_base_name> <operation>"
  echo "Operations: dateTime | timing.seconds | timing.text" >&2
fi

operation="$1"
file_base_name="$2"

timestamp=$(date +"%Y%m%d_%H%M%S")
new_file_name=${file_base_name}_${timestamp}.json

jq . "${file_base_name}.json"

case "$operation" in
timing)
  jq '.timing.event = (.Occurrence.Timing.event[0].seconds | todate) |
    .timing.text = (.Occurrence.Timing.text) |
    del(.Occurrence)' \
    "${file_base_name}.json" >"${new_file_name}"
  ;;
dateTime)
  jq '.dateTime = (.Occurrence.DateTime.seconds | todate) | del(.Occurrence)' \
    "${file_base_name}.json" >"${new_file_name}"
  ;;
*)
  echo "Invalid operation: $operation"
  echo "Valid operations: timing | dateTime" >&2
  ;;
esac

jq '.ibpf_key.timestamp = (.ibpf_key.timestamp.seconds | todate)' "${new_file_name}" > tmp.json && mv tmp.json "${new_file_name}"
jq . "${new_file_name}"

echo "Processing complete. Output file: ${file_base_name}_${timestamp}.json"
