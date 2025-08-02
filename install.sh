#!/usr/bin/env bash

set -euo pipefail

IVIM_HOME="$HOME/.config/ivim"
init_file="$IVIM_HOME/init.lua"

file_names=(
    "init.lua"
    "lazy-lock.json"
)

for f in "${file_names[@]}"
do
    src_file="$PWD/$f"
    dest_file="$IVIM_HOME/$f"
    rm -f "$dest_file"
    echo "Symlinking $src_file to $dest_file"
    ln -s "$src_file" "$dest_file"
done
