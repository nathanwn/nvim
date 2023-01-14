local conditions = require("heirline.conditions")
local palette = require("nathan-wien.themes.catppuccin").palette

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
  condition = conditions.is_git_repo,
  init = function(self)
    self.added = vim.b.gitsigns_status_dict.added
    self.removed = vim.b.gitsigns_status_dict.removed
    self.changed = vim.b.gitsigns_status_dict.changed
  end,
  hl = {
    bg = palette.mantle,
  },
  padding,
  {
    provider = function(self)
      local count = self.added or 0
      return count > 0 and (string.format("+%d", count))
    end,
    hl = {
      fg = palette.green,
    },
  },
  {
    provider = function(self)
      local count = self.removed or 0
      return count > 0 and (string.format("-%d", count))
    end,
    hl = { fg = palette.red },
  },
  {
    provider = function(self)
      local count = self.changed or 0
      return count > 0 and (string.format("~%d", count))
    end,
    hl = { fg = palette.yellow },
  },
  padding,
}
