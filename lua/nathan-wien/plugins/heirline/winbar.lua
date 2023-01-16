local conditions = require("heirline.conditions")
local filename = require("nathan-wien.plugins.heirline.components.filename")

return {
  -- The evaluation will stop at the first child that has no condition, or which condition evaluates to true
  fallthrough = false,
  { -- Hide the winbar for special buffers
    condition = function()
      return conditions.buffer_matches({
        buftype = { "nofile", "prompt", "help", "quickfix" },
        filetype = { "^git.*", "fugitive", "undotree", "diff" },
      })
    end,
    init = function()
      vim.opt_local.winbar = nil
    end,
  },
  { -- A special winbar for terminals
    condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    filename,
  },
  { -- An inactive winbar for regular files
    condition = function()
      return not conditions.is_active()
    end,
    filename,
  },
  -- A winbar for regular files
  filename,
}
