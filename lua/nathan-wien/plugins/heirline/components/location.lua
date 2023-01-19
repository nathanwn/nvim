local utils = require("heirline.utils")

return {
  provider = " %l:%c ",
  hl = {
    fg = utils.get_highlight("HeirlineLocation").fg,
    bg = utils.get_highlight("HeirlineLocation").bg,
  },
}
