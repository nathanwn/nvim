local keys = require("nathan-wien.keys")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true, notify = false },
    quickfile = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    {
      keys.find.git_files,
      function()
        Snacks.picker.git_files()
      end,
      mode = "n",
    },
    {
      keys.find.git_grep,
      function()
        Snacks.picker.git_grep()
      end,
      mode = "n",
    },
  },
}
