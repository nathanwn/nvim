local utils = require("heirline.utils")

return {
  provider = function()
    if string.len(vim.bo.filetype) > 0 then
      return string.format(" %s ", vim.bo.filetype)
    else
      return ""
    end
  end,
  hl = {
    fg = utils.get_highlight("@comment.todo").fg,
    bold = true,
  },
}
