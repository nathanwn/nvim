return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  version = "2.13.2",
  config = function()
    -- for more template configurations, see the language's configuration file in configurations/{lang}.lua
    require("neogen").setup({
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
      },
    })
  end,
  keys = {
    {
      ",cf",
      function()
        require("neogen").generate({ type = "func" })
      end,
      desc = "docstring",
    },
    {
      ",cm",
      function()
        require("neogen").generate({ type = "file" })
      end,
      desc = "docstring",
    },
    {
      ",ct",
      function()
        require("neogen").generate({ type = "type" })
      end,
      desc = "docstring",
    },
    {
      ",cc",
      function()
        require("neogen").generate({ type = "class" })
      end,
      desc = "docstring",
    },
  },
}
