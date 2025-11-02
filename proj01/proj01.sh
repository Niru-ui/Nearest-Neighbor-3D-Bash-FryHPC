#!/bin/bash
# Name: Niru Adhikari
# Wnumber: wnumber
# Assignment name: proj01
# Tested on: Fry

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 filename index" >&2
    exit 1
fi

file="$1"
index="$2"

if [ ! -f "$file" ]; then
    echo "Error: file '$file' not found." >&2
    exit 1
fi

if ! echo "$index" | grep -Eq '^[0-9]+$'; then
    echo "Error: index must be a positive integer." >&2
    exit 1
fi

lines=$(sed '1d' "$file" | sed '/^[[:space:]]*$/d')

n=$(echo "$lines" | wc -l | tr -d ' ')

names=()
xs=()
ys=()
zs=()

while IFS=',' read -r name x y z; do
    names+=("$name")
    xs+=("$x")
    ys+=("$y")
    zs+=("$z")
done <<< "$lines"

if [ "$index" -lt 1 ] || [ "$index" -gt "$n" ]; then
    echo "Error: index out of range (1..$n)" >&2
    exit 1
fi

ref_idx=$(( index - 1 ))
rx=${xs[$ref_idx]}
ry=${ys[$ref_idx]}
rz=${zs[$ref_idx]}

min_dist=""
min_name=""

for i in "${!names[@]}"; do
    if [ "$i" -eq "$ref_idx" ]; then
        continue
    fi

    expr="($rx - ${xs[$i]})^2 + ($ry - ${ys[$i]})^2 + ($rz - ${zs[$i]})^2"
    dist=$(echo "scale=1; sqrt($expr)" | bc -l)

    if [ -z "$min_dist" ]; then
        min_dist="$dist"
        min_name="${names[$i]}"
    else
        is_less=$(echo "$dist < $min_dist" | bc -l)
        if [ "$is_less" -eq 1 ]; then
            min_dist="$dist"
            min_name="${names[$i]}"
        fi
    fi
done

echo "Nearest neighbor to ${names[$ref_idx]} is $min_name with distance $min_dist"







