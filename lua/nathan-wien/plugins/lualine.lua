return function(theme)
  require("lualine").setup({
    options = {
      theme = theme,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "diff", "diagnostics" },
      lualine_x = { "filetype" },
      lualine_y = { "encoding", "fileformat" },
      lualine_z = { "location" },
    },
  })
end
