local palette = require("nathan-wien.plugins.catppuccin").palette
local conditions = require("heirline.conditions")

local branch = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.branch = vim.b.gitsigns_status_dict.head
  end,
  provider = function(self)
    return string.format("  %s ", self.branch)
  end,
  hl = { fg = "#FFFFFF", bg = palette.mauve, bold = true },
}

return branch
