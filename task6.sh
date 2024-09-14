#!/bin/bash

# Check if an argument (filename to match) is provided
if [ -z "$1" ]; then
    echo "Please provide a filename to search for."
    exit 1
fi

input_file=$1  # The user-provided input (filename to match)

if [[ $FOO -eq 5 && $BAR -eq 1 ]]; then
    echo "Execution prohibited."
    exit 1
fi

# Infinite loop to keep checking for files
while true; do
    for file in *; do
        # Check if the file name matches the user-provided input
        if [[ "$file" == "$input_file" && -f "$file" ]]; then
            echo "File $file appeared and matches the input."
            exit 0
        fi
    done
    sleep 1
done
