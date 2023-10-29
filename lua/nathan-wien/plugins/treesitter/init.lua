return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- commit = "7be9ebd06abe2ed836abd3e91acb0b243ddcafba",
    version = "v0.9.1",
    build = ":TSUpdate",
    config = require("nathan-wien.plugins.treesitter.config.treesitter"),
  },
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("nathan-wien.plugins.treesitter.config.playground"),
  },
}
