vim.g.symbols_outline = {
  keymaps = {
    hover_symbol = "H",
  },
}

vim.keymap.set("n", "<Leader>vo", "<cmd>SymbolsOutline<CR>")
