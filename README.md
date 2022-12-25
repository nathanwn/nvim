# My Personal Neovim Configuration

## Introduction

This repository is a copy of my `~/.config/nvim/` directory.

Over time, my neovim configuration has grown to a point where it makes sense to separate it into a separated repository from my dotfiles repository. To set up, I can just run:

```bash
ln -s $PWD ~/.config/nvim
```

## Structure

Important directories:

- [`after/ftplugin`](after/ftplugin): File-type specific settings.
- [`after/plugin`](after/plugin): Configuration loaders for plugins, with some simple configurations. Scripts in this directory should load complex configurations and utilities from `lua/nathan-wien`.
- [`ftdetect`](`ftdetect`): Autocommands to set filetypes.
- [`ftplugin`](`ftplugin`): Similar to `after/ftplugin` (almost). [More details](https://vi.stackexchange.com/a/12735).
- [`lua/nathan-wien`](lua/nathan-wien): Complex configurations and utilities.

For more info, run `:h rtp`.
