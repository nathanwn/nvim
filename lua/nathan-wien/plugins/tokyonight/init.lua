local custom_theme = require("nathan-wien.plugins.tokyonight.papercolor-light")

return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  version = "v3.0.1",
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- Note: this should NOT be `day`, as the `day` colorscheme activates
      -- "color transformation".
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "night", -- The theme is used when the background is set to light
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
        custom_theme.on_colors(colors)
      end,
      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        custom_theme.on_highlights(highlights, colors)
      end,
    })
    -- Note: do NOT turn this on, as this also "activates" color transformation.
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight")
  end,
}
