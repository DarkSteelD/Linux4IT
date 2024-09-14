#!/bin/bash

# Split the PATH variable by colons and loop through each directory
for dir in ${PATH//:/ }; do
    # Check if the directory exists and is not a symbolic link
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        # Count the number of regular files in the directory
        file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
        echo "$dir: $file_count regular files"
    else
        echo "$dir: Directory does not exist or is a symbolic link, skipping..."
    fi
done
