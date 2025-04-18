local config = function()
  require("nvim-tree").setup({
    view = {
      adaptive_size = true,
    },
    filters = {
      custom = {
        "^.git$",
        -- python
        ".venv",
        "__pycache__",
        "*.egg-info",
        ".pytest_cache",
        -- latex
        "_minted-main",
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
        "*.nav",
        "*.snm",
        "*.synctex(busy)",
        "*.synctex.gz",
        "*.toc",
        "*.vrb",
      },
    },
    renderer = {
      add_trailing = true,
      group_empty = true,
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
          git = false,
        },
      },
    },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1.11.0",
  config = config,
  keys = {
    {
      require("nathan-wien.keys").view.filetree,
      "<cmd>NvimTreeToggle<CR>",
      mode = "n",
      desc = "Toggle file tree",
    },
  },
}
