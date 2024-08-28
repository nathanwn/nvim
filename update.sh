#!/bin/bash

set -euo pipefail

pushd ../../..
rm -rf ~/.config/nvim
stow nvim

popd || exit 1
