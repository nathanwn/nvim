return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = require("nathan-wien.plugins.treesitter.config.treesitter"),
  },
  {
    "nvim-treesitter/playground",
    cond = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("nathan-wien.plugins.treesitter.config.playground"),
  },
}
