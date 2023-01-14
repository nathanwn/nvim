local palette = require("nathan-wien.themes.catppuccin").palette

return {
  provider = function()
    if string.len(vim.bo.filetype) > 0 then
      return string.format(" %s ", vim.bo.filetype)
    else
      return ""
    end
  end,
  hl = {
    fg = "#FFFFFF",
    bg = palette.mauve,
    bold = true,
  },
}
