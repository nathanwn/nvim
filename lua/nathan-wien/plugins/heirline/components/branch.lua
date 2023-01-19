local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local branch = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.branch = vim.b.gitsigns_status_dict.head
  end,
  provider = function(self)
    return string.format(" %s ", self.branch)
  end,
  hl = {
    fg = utils.get_highlight("HeirlineBranch").fg,
    bg = utils.get_highlight("HeirlineBranch").bg,
    bold = true,
  },
}

return branch
