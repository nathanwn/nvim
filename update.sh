#!/bin/bash

pushd ../../..
rm -rf ~/.config/nvim
stow nvim

popd || exit 1
