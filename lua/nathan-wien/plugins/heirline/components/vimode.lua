local conditions = require("nathan-wien.plugins.heirline.conditions")
local utils = require("heirline.utils")

local mode_container = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()

    -- execute this only once, this is required if you want the ViMode
    -- component to be updated on operator pending mode
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = "redrawstatus",
      })
      self.once = true
    end
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    modes = {
      ["n"] = { name = "NORMAL", hlgroup = "HeirlineViModeNormal" },
      ["no"] = { name = "OP", hlgroup = "HeirlineViModeNormal" },
      ["nov"] = { name = "OP", hlgroup = "HeirlineViModeNormal" },
      ["noV"] = { name = "OP", hlgroup = "HeirlineViModeNormal" },
      ["no"] = { name = "OP", hlgroup = "HeirlineViModeNormal" },
      ["niI"] = { name = "NORMAL", hlgroup = "HeirlineViModeNormal" },
      ["niR"] = { name = "NORMAL", hlgroup = "HeirlineViModeNormal" },
      ["niV"] = { name = "NORMAL", hlgroup = "HeirlineViModeNormal" },
      ["i"] = { name = "INSERT", hlgroup = "HeirlineViModeInsert" },
      ["ic"] = { name = "INSERT", hlgroup = "HeirlineViModeInsert" },
      ["ix"] = { name = "INSERT", hlgroup = "HeirlineViModeInsert" },
      ["t"] = { name = "TERM", hlgroup = "HeirlineViModeTerminal" },
      ["nt"] = { name = "TERM", hlgroup = "HeirlineViModeTerminal" },
      ["v"] = { name = "VISUAL", hlgroup = "HeirlineViModeVisual" },
      ["vs"] = { name = "VISUAL", hlgroup = "HeirlineViModeVisual" },
      ["V"] = { name = "V-LINE", hlgroup = "HeirlineViModeVisual" },
      ["Vs"] = { name = "V-LINE", hlgroup = "HeirlineViModeVisual" },
      ["\22"] = { name = "V-BLOCK", hlgroup = "HeirlineViModeVisual" },
      ["\22s"] = { name = "V-BLOCK", hlgroup = "HeirlineViModeVisual" },
      ["R"] = { name = "REPLACE", hlgroup = "HeirlineViModeReplace" },
      ["Rc"] = { name = "REPLACE", hlgroup = "HeirlineViModeReplace" },
      ["Rx"] = { name = "REPLACE", hlgroup = "HeirlineViModeReplace" },
      ["Rv"] = { name = "V-REPLACE", hlgroup = "HeirlineViModeReplace" },
      ["s"] = { name = "SELECT", hlgroup = "HeirlineViModeVisual" },
      ["S"] = { name = "SELECT", hlgroup = "HeirlineViModeVisual" },
      [""] = { name = "BLOCK", hlgroup = "HeirlineViModeVisual" },
      ["c"] = { name = "COMMAND", hlgroup = "HeirlineViModeCommand" },
      ["cv"] = { name = "COMMAND", hlgroup = "HeirlineViModeCommand" },
      ["ce"] = { name = "COMMAND", hlgroup = "HeirlineViModeCommand" },
      ["r"] = { name = "PROMPT", hlgroup = "HeirlineViModeInactive" },
      ["rm"] = { name = "MORE", hlgroup = "HeirlineViModeInactive" },
      ["r?"] = { name = "CONFIRM", hlgroup = "HeirlineViModeInactive" },
      ["!"] = { name = "SHELL", hlgroup = "HeirlineViModeInactive" },
      ["null"] = { name = "null", hlgroup = "HeirlineViModeInactive" },
    },
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    local mode
    if conditions.view_is_full() then
      mode = self.modes[self.mode].name
    else
      mode = string.upper(string.sub(self.modes[self.mode].hlgroup, 1, 1))
    end
    return string.format(" %s ", mode)
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local hlgroup = self.modes[self.mode].hlgroup
    return {
      fg = utils.get_highlight(hlgroup).fg,
      bg = utils.get_highlight(hlgroup).bg,
      bold = true,
    }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- This is not required in any way, but it's there, and it's a small
  -- performance improvement.
  update = {
    "ModeChanged",
  },
}

return mode_container
