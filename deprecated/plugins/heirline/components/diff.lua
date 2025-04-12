local conditions = vim.tbl_extend(
  "force",
  require("heirline.conditions"),
  require("nathan-wien.plugins.heirline.conditions")
)
local utils = require("heirline.utils")

local padding = {
  provider = function(self)
    local empty = true
    if self.added and self.added > 0 then
      empty = false
    end
    if self.removed and self.removed > 0 then
      empty = false
    end
    if self.changed and self.changed > 0 then
      empty = false
    end
    if empty then
      return ""
    else
      return " "
    end
  end,
}

return {
  condition = function()
    return conditions.view_is_full() and conditions.is_git_repo()
  end,
  init = function(self)
    self.added = vim.b.gitsigns_status_dict.added
    self.removed = vim.b.gitsigns_status_dict.removed
    self.changed = vim.b.gitsigns_status_dict.changed
  end,
  hl = {
    bg = utils.get_highlight("StatusLine").bg,
  },
  padding,
  {
    provider = function(self)
      local count = self.added or 0
      return count > 0 and (string.format("+%d", count))
    end,
    hl = {
      fg = utils.get_highlight("GitSignsAdd").fg,
    },
  },
  {
    provider = function(self)
      local count = self.removed or 0
      return count > 0 and (string.format("-%d", count))
    end,
    hl = {
      fg = utils.get_highlight("GitSignsDelete").fg,
    },
  },
  {
    provider = function(self)
      local count = self.changed or 0
      return count > 0 and (string.format("~%d", count))
    end,
    hl = {
      fg = utils.get_highlight("GitSignsChange").fg,
    },
  },
  padding,
}
