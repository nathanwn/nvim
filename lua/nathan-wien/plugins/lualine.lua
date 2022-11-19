return function(theme)
  require("lualine").setup({
    options = {
      theme = theme,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      -- lualine_c = { "filename" },
      lualine_x = { "diff", "diagnostics" },
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
  })
end
