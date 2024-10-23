local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- Hierarchy:
-- filename_container
--     filename
--     fileflags

local filename_container = {
  -- Constructor to set up attributes needed by this component and its children.
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local filename_active = {
  condition = conditions.is_active,
  hl = {
    -- fg = utils.get_highlight("HeirlineFilenameActive").fg,
    -- bg = utils.get_highlight("HeirlineFilenameActive").bg,
    fg = utils.get_highlight("TabLineSel").fg,
    bg = utils.get_highlight("TabLineSel").bg,
    bold = true,
  },
}

local filename_inactive = {
  condition = conditions.is_not_active,
  hl = {
    -- fg = utils.get_highlight("HeirlineFilenameInactive").fg,
    -- bg = utils.get_highlight("HeirlineFilenameInactive").bg,
    fg = utils.get_highlight("TabLine").fg,
    bg = utils.get_highlight("TabLine").bg,
  },
}

local filename = {
  provider = function(self)
    -- Trim the pattern relative to the current directory.
    -- See :h filename-modifiers for more options.
    local filename = self.filename

    if filename == "" then
      return "[No Name]"
    end

    filename = vim.fn.fnamemodify(filename, ":~:.")

    -- If the filename occupies more than 70% of the available
    -- space, we trim the file path to its initials.
    -- See "Flexible Components" dynamic truncation.
    if not conditions.width_percent_below(#filename, 0.7) then
      filename = vim.fn.pathshorten(filename)
    end

    -- A bit of padding.
    filename = string.format(" %s ", filename)

    return filename
  end,
}

local fileflags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
  },
}

filename_active = utils.insert(filename_active, filename, fileflags)
filename_inactive = utils.insert(filename_inactive, filename, fileflags)
filename_container =
  utils.insert(filename_container, filename_active, filename_inactive)

return filename_container
