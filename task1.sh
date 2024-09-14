#!/bin/bash
output_file=$1
duration=$2

end_time=$((SECONDS + duration))
while [ $SECONDS -lt $end_time ]; do
    echo "$(date +%d.%m.%y\ %H:%M) = $(cat /proc/loadavg)" >> "$output_file"
    sleep 1
done

