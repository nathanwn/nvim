local utils = require("heirline.utils")

return {
  condition = require("nvim-navic").is_available,
  provider = function()
    local status = require("nvim-navic").get_location({ highlight = true })
    if string.len(status) > 0 then
      return string.format(" %s ", status)
    else
      return ""
    end
  end,
  update = "CursorMoved",
  hl = {
    bg = utils.get_highlight("StatusLine").bg,
  },
}
