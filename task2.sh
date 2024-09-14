#!/bin/bash
dir_path=$1

if [ ! -d "$dir_path" ]; then
    echo "Directory does not exist"
    exit 1
fi

for subdir in "$dir_path"/*/; do
    count=$(ls -1q "$subdir" | wc -l)
    echo "$count" > "$subdir/$(basename "$subdir").txt"
done
