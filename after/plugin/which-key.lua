local which_key = require("which-key")

which_key.setup({
  triggers = {
    "<leader>",
    ",",
  },
})

which_key.register({
  ["?"] = {
    name = "print helper",
    p = {
      function()
        print("Current working directory: " .. vim.fn.getcwd())
      end,
      "current working directory",
    },
  },
}, { prefix = "," })
