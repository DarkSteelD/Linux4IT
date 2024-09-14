#!/bin/bash
output_p=$1
for file in /var/log/*.log; do
    tail -n 1 "$file" >> "$output_p/logs.log"
done
