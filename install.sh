#!/usr/bin/env bash

set -euo pipefail

NVIM_HOME="$HOME/.config/nvim"
init_file="$NVIM_HOME/init.lua"

file_names=(
    "init.lua"
    "lazy-lock.json"
)

mkdir -p "$NVIM_HOME"
for f in "${file_names[@]}"
do
    src_file="$PWD/$f"
    dest_file="$NVIM_HOME/$f"
    rm -f "$dest_file"
    echo "Symlinking $src_file to $dest_file"
    ln -s "$src_file" "$dest_file"
done
