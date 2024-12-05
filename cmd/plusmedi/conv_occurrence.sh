#! /usr/bin/env bash

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <file_base_name> <operation>"
  echo "Operations: dateTime | timing.seconds | timing.text" >&2
fi

operation="$1"
file_base_name="$2"

timestamp=$(date +"%Y%m%d_%H%M%S")

jq . "${file_base_name}.json"

case "$operation" in
timing)
  jq '.timing.event = (.Occurrence.Timing.event[0].seconds | todate) | 
    .timing.text = (.Occurrence.Timing.text) | 
    del(.Occurrence)' \
    "${file_base_name}.json" >"${file_base_name}_${timestamp}.json"
  ;;
dateTime)
  jq '.dateTime = (.Occurrence.DateTime.seconds | todate) | del(.Occurrence)' \
  "${file_base_name}.json" >"${file_base_name}_${timestamp}.json"
  ;;
*)
  echo "Invalid operation: $operation"
  echo "Valid operations: timing | dateTime" >&2
  ;;
esac

jq . "${file_base_name}_${timestamp}.json"

echo "Processing complete. Output file: ${file_base_name}_${timestamp}.json"
