#!/bin/bash
for file in "$@"; do
    if [ -f "$file" ]; then
        echo "$file: $(wc -l < "$file")"
    else
        echo "$file does not exist"
    fi
done

