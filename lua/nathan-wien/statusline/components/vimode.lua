local palette = require("nathan-wien.themes.catppuccin").palette

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
      ["n"] = { name = "NORMAL", hlgroup = "normal" },
      ["no"] = { name = "OP", hlgroup = "normal" },
      ["nov"] = { name = "OP", hlgroup = "normal" },
      ["noV"] = { name = "OP", hlgroup = "normal" },
      ["no"] = { name = "OP", hlgroup = "normal" },
      ["niI"] = { name = "NORMAL", hlgroup = "normal" },
      ["niR"] = { name = "NORMAL", hlgroup = "normal" },
      ["niV"] = { name = "NORMAL", hlgroup = "normal" },
      ["i"] = { name = "INSERT", hlgroup = "insert" },
      ["ic"] = { name = "INSERT", hlgroup = "insert" },
      ["ix"] = { name = "INSERT", hlgroup = "insert" },
      ["t"] = { name = "TERM", hlgroup = "terminal" },
      ["nt"] = { name = "TERM", hlgroup = "terminal" },
      ["v"] = { name = "VISUAL", hlgroup = "visual" },
      ["vs"] = { name = "VISUAL", hlgroup = "visual" },
      ["V"] = { name = "V-LINE", hlgroup = "visual" },
      ["Vs"] = { name = "V-LINE", hlgroup = "visual" },
      ["\22"] = { name = "V-BLOCK", hlgroup = "visual" },
      ["\22s"] = { name = "V-BLOCK", hlgroup = "visual" },
      ["R"] = { name = "REPLACE", hlgroup = "replace" },
      ["Rc"] = { name = "REPLACE", hlgroup = "replace" },
      ["Rx"] = { name = "REPLACE", hlgroup = "replace" },
      ["Rv"] = { name = "V-REPLACE", hlgroup = "replace" },
      ["s"] = { name = "SELECT", hlgroup = "visual" },
      ["S"] = { name = "SELECT", hlgroup = "visual" },
      [""] = { name = "BLOCK", hlgroup = "visual" },
      ["c"] = { name = "COMMAND", hlgroup = "command" },
      ["cv"] = { name = "COMMAND", hlgroup = "command" },
      ["ce"] = { name = "COMMAND", hlgroup = "command" },
      ["r"] = { name = "PROMPT", hlgroup = "inactive" },
      ["rm"] = { name = "MORE", hlgroup = "inactive" },
      ["r?"] = { name = "CONFIRM", hlgroup = "inactive" },
      ["!"] = { name = "SHELL", hlgroup = "inactive" },
      ["null"] = { name = "null", hlgroup = "inactive" },
    },
    colors = {
      ["normal"] = {
        fg = "#FFFFFF",
        bg = palette.blue,
      },
      ["insert"] = {
        fg = palette.blue,
        bg = "#FFFFFF",
      },
      ["visual"] = {
        fg = "#FFFFFF",
        bg = palette.sapphire,
      },
      ["replace"] = {
        fg = "#FFFFFF",
        bg = palette.sky,
      },
      ["command"] = {
        fg = "#FFFFFF",
        bg = palette.yellow,
      },
      ["inactive"] = {
        fg = "#FFFFFF",
        bg = palette.subtext0,
      },
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
    return " " .. self.modes[self.mode].name .. " "
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    return {
      fg = self.colors[self.modes[self.mode].hlgroup].fg,
      bg = self.colors[self.modes[self.mode].hlgroup].bg,
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
