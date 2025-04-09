require("nathan-wien.core")

if not vim.g.vscode then
  -- Bootstrap.
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  local config = {
    cond = not vim.g.vscode,
  }

  require("lazy").setup("nathan-wien.plugins", config)
  require("nathan-wien.myplugins")
else
  require("nathan-wien.vscode")
end
