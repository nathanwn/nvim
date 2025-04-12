local utils = require("heirline.utils")

return {
  provider = " %l:%c ",
  hl = {
    fg = utils.get_highlight("@comment.hint").fg,
  },
}
