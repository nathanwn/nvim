return {
  "folke/tokyonight.nvim",
  r = "main",
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
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
      day_brightness = 0.3,
      -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
      -- Should work with the standard **StatusLine** and **LuaLine**.
      hide_inactive_statusline = false,
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.bg = "#000080"
        colors.bg_dark = "#003090"
        colors.bg_float = "#003090"
        colors.bg_highlight = "#003090"
        colors.bg_popup = "#003090"
        colors.bg_search = "#008080"
        colors.bg_sidebar = "#003090"
        colors.bg_statusline = "#003090"
        colors.bg_visual = "#283457"
        colors.black = "#15161e"
        colors.blue = "#7aa2f7"
        colors.blue0 = "#3d59a1"
        colors.blue1 = "#2ac3de"
        colors.blue2 = "#0db9d7"
        colors.blue5 = "#89ddff"
        colors.blue6 = "#b4f9f8"
        colors.blue7 = "#394b70"
        colors.border = "#15161e"
        colors.border_highlight = "#27a1b9"
        colors.comment = "#565f89"
        colors.cyan = "#7dcfff"
        colors.dark3 = "#545c7e"
        colors.dark5 = "#737aa2"
        colors.diff = {
          add = "#20303b",
          change = "#1f2231",
          delete = "#37222c",
          text = "#394b70",
        }
        colors.error = "#db4b4b"
        colors.fg = "#c0caf5"
        colors.fg_dark = "#a9b1d6"
        colors.fg_float = "#c0caf5"
        colors.fg_gutter = "#3b4261"
        colors.fg_sidebar = "#a9b1d6"
        colors.git = {
          add = "#4097a3",
          change = "#506d9b",
          delete = "#c47981",
          ignore = "#545c7e",
        }
        colors.gitSigns = {
          add = "#399a96",
          change = "#6382bd",
          delete = "#c25d64",
        }
        colors.green = "#00CC00"
        colors.green1 = "#00AA00"
        colors.green2 = "#009900"
        colors.hint = "#1abc9c"
        colors.info = "#0db9d7"
        colors.magenta = "#bb9af7"
        colors.magenta2 = "#ff007c"
        colors.none = "NONE"
        colors.orange = "#ff9e64"
        colors.purple = "#9d7cd8"
        colors.red = "#e75050"
        colors.red1 = "#db4b4b"
        colors.teal = "#1abc9c"
        colors.terminal_black = "#414868"
        colors.warning = "#e0af68"
        colors.yellow = "#e0af68"
      end,
      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        local _ = highlights
        local _ = colors
      end,
    })
    -- vim.cmd.colorscheme("tokyonight")
  end,
}
