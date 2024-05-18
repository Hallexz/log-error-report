#!/bin/bash

echo "Enter the path to your log file:"
read logfile

if [ ! -f "$logfile" ]
then
    echo "File $logfile not found."
    exit 1
fi

filename=$(basename -- "$logfile")
dirname=$(dirname -- "$logfile")
base="${filename%.*}"

error_report="$dirname/${base}_error_report.log"

echo "Searching for errors in $logfile..."
grep -i "error" "$logfile" > "$error_report"

if [ -s "$error_report" ]
then
    echo "Error report created: $error_report"
else
    echo "No errors found."
fi
