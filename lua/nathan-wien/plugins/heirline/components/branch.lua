local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local branch = {
  condition = conditions.is_git_repo,
  init = function(self)
    if vim.b.gitsigns_status_dict then
      if vim.b.gitsigns_status_dict.head == "" then
        self.branch = "[no branch]"
      else
        self.branch = vim.b.gitsigns_status_dict.head
      end
    end
  end,
  provider = function(self)
    local branch_label
    local limit = 15
    if string.len(self.branch) > limit then
      branch_label = string.format("%s...", string.sub(self.branch, 1, limit))
    else
      branch_label = self.branch
    end
    return string.format(" %s ", branch_label)
  end,
  hl = {
    fg = utils.get_highlight("@comment.note").fg,
    bold = true,
  },
}

return branch
