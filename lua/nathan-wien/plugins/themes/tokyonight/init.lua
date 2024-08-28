local custom_theme_name = vim.env.GLOBAL_THEME or "tokyonight-day"

local custom_theme = nil
if vim.tbl_contains({
  "bsol",
  "papercolor-light",
}, custom_theme_name) then
  custom_theme = require("nathan-wien.plugins.themes.tokyonight." .. custom_theme_name)
end

return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  version = "v4.8.0",
  cond = custom_theme ~= nil,
  config = function()
    require("tokyonight").setup({
      -- TODO: remove this once https://github.com/folke/tokyonight.nvim/pull/620 is closed.
      plugins = { markdown = true },
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      sidebars = { "qf", "help" },
      -- Adjusts the brightness of the colors of the **Day** style.
      -- Number between 0 and 1, from dull to vibrant colors
      day_brightness = 0,
      -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
      -- Should work with the standard **StatusLine** and **LuaLine**.
      hide_inactive_statusline = false,
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        if custom_theme ~= nil then
          custom_theme.on_colors(colors)
        end
      end,
      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        if custom_theme ~= nil then
          custom_theme.on_highlights(highlights, colors)
        end
      end,
    })
    -- Note: do NOT turn this on, as this also "activates" color transformation.
    -- vim.o.background = "light"
    vim.cmd.colorscheme("tokyonight-day")
  end,
}
