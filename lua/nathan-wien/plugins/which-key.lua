return {
  "folke/which-key.nvim",
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      triggers = {
        "<leader>",
        ",",
      },
    })

    which_key.register({
      ["<leader>f"] = { name = "Find" },
      ["<leader>g"] = { name = "LSP" },
      ["<leader>v"] = { name = "View" },
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
  end,
}
