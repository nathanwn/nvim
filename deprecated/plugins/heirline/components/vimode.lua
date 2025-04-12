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
      ["n"] = { name = "NORMAL", hlgroup = "@comment.todo" },
      ["no"] = { name = "OP", hlgroup = "@comment.todo" },
      ["nov"] = { name = "OP", hlgroup = "@comment.todo" },
      ["noV"] = { name = "OP", hlgroup = "@comment.todo" },
      ["no"] = { name = "OP", hlgroup = "@comment.todo" },
      ["niI"] = { name = "NORMAL", hlgroup = "@comment.todo" },
      ["niR"] = { name = "NORMAL", hlgroup = "@comment.todo" },
      ["niV"] = { name = "NORMAL", hlgroup = "@comment.todo" },
      ["i"] = { name = "INSERT", hlgroup = "@comment.note" },
      ["ic"] = { name = "INSERT", hlgroup = "@comment.note" },
      ["ix"] = { name = "INSERT", hlgroup = "@comment.note" },
      ["t"] = { name = "TERM", hlgroup = "@comment.hint" },
      ["nt"] = { name = "TERM", hlgroup = "@comment.hint" },
      ["v"] = { name = "VISUAL", hlgroup = "@comment.hint" },
      ["vs"] = { name = "VISUAL", hlgroup = "@comment.hint" },
      ["V"] = { name = "V-LINE", hlgroup = "@comment.hint" },
      ["Vs"] = { name = "V-LINE", hlgroup = "@comment.hint" },
      ["\22"] = { name = "V-BLOCK", hlgroup = "@comment.hint" },
      ["\22s"] = { name = "V-BLOCK", hlgroup = "@comment.hint" },
      ["R"] = { name = "REPLACE", hlgroup = "@comment.warning" },
      ["Rc"] = { name = "REPLACE", hlgroup = "@comment.warning" },
      ["Rx"] = { name = "REPLACE", hlgroup = "@comment.warning" },
      ["Rv"] = { name = "V-REPLACE", hlgroup = "@comment.warning" },
      ["s"] = { name = "SELECT", hlgroup = "@comment.hint" },
      ["S"] = { name = "SELECT", hlgroup = "@comment.hint" },
      [""] = { name = "BLOCK", hlgroup = "@comment.hint" },
      ["c"] = { name = "COMMAND", hlgroup = "@comment.error" },
      ["cv"] = { name = "COMMAND", hlgroup = "@comment.error" },
      ["ce"] = { name = "COMMAND", hlgroup = "@comment.error" },
      ["r"] = { name = "PROMPT", hlgroup = "@comment.hint" },
      ["rm"] = { name = "MORE", hlgroup = "@comment.hint" },
      ["r?"] = { name = "CONFIRM", hlgroup = "@comment.hint" },
      ["!"] = { name = "SHELL", hlgroup = "@comment.hint" },
      ["null"] = { name = "null", hlgroup = "@comment.hint" },
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
    local mode = self.modes[self.mode].name
    if not conditions.view_is_full() then
      mode = string.upper(string.sub(mode, 1, 1))
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
