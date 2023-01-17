local navic = require("nvim-navic")
local conditions = require("nathan-wien.plugins.heirline.conditions")
local utils = require("heirline.utils")

return {
  condition = function()
    return conditions.view_is_full() and navic.is_available()
  end,
  provider = function()
    local status = navic.get_location({ highlight = true })
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
