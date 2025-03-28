local custom_theme_name = nil
if vim.env.GLOBAL_THEME and string.match(vim.env.GLOBAL_THEME, "base16-.*") then
  custom_theme_name = vim.env.GLOBAL_THEME
end

return {
  "RRethy/base16-nvim",
  name = "base16-nvim",
  lazy = false,
  cond = custom_theme_name ~= nil,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.cmd.colorscheme(custom_theme_name)
  end
}
