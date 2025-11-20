#!/bin/bash

# Script file name

self=$(basename "$0" )

# Ext received by argument

extension="$1"

# If to verify the existence of a extension or not and create the files variable based on it

if [ -n "$extension" ]; then
	files=($(find . -maxdepth 1 -type f -name "*.$extension" ! -name "$self")) # 'variable=()' its the way to create a array variable in shellscript
else
	files=($(find . -maxdepth 1 -type f ! -name "$self"))
fi

# Count of files in the current directory

total=${#files[@]}
half=$((total / 2)) # Double parenthesis for bash to interpret it like a arithmetic operation

# This command write every file on one line, shuffle all it line and select only the first half of them then runs a while to print the removing message

printf "%s\n" "${files[@]}" | shuf | head -n "$half" | while read -r file; do
	echo "Removing file: $file"
	# rm -f "$file"
done

echo "🟣🌌🧤 *S N A P* 🧤🌌🟣
“Perfectly balanced… as all things should be.”"

