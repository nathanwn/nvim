local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local get_sign = function(name)
  return string.gsub(vim.fn.sign_getdefined(name)[1].text, "%s+", "")
end

local padding = {
  provider = function(self)
    local empty = true
    if self.errors and self.errors > 0 then
      empty = false
    end
    if self.warnings and self.warnings > 0 then
      empty = false
    end
    if self.hints and self.hints > 0 then
      empty = false
    end
    if self.info and self.info > 0 then
      empty = false
    end
    if empty then
      return ""
    else
      return " "
    end
  end,
}

local diagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = get_sign("DiagnosticSignError"),
    warn_icon = get_sign("DiagnosticSignWarn"),
    info_icon = get_sign("DiagnosticSignInfo"),
    hint_icon = get_sign("DiagnosticSignHint"),
  },
  hl = {
    bg = utils.get_highlight("StatusLine").bg,
  },
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = {
      fg = utils.get_highlight("DiagnosticError").fg,
    },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = {
      fg = utils.get_highlight("DiagnosticWarn").fg,
    },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = {
      fg = utils.get_highlight("DiagnosticInfo").fg,
    },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = {
      fg = utils.get_highlight("DiagnosticHint").fg,
    },
  },
  padding,
}

return diagnostics
