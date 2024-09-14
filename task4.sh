#!/bin/bash
declare -A planets=(
    ["Mercury"]=0
    ["Venus"]=0
    ["Earth"]=1
    ["Mars"]=2
    ["Jupiter"]=79
    ["Saturn"]=83
    ["Uranus"]=27
    ["Neptune"]=14
)

planet_name=$1
if [[ -n ${planets[$planet_name]} ]]; then
    echo "$planet_name has ${planets[$planet_name]} satellites."
else
    echo "No such planet."
    exit 1
fi
