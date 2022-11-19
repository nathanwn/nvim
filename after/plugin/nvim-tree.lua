require("nvim-tree").setup({
  filters = {
    custom = {
      ".git",
      -- python
      ".venv",
      "__pycache__",
      "*.egg-info",
      ".pytest_cache",
      -- latex
      "*.aux",
      "*.bbl",
      "*.blg",
      "*.bcf",
      "*.fdb_latexmk",
      "*.fls",
      "*.glo",
      "*.ist",
      "*.lof",
      "*.log",
      "*.lot",
      "*.synctex.gz",
      "*.toc",
    },
  },
})

vim.keymap.set("n", "<Leader>ve", "<cmd>NvimTreeToggle<CR>")
