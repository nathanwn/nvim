require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "go",
    "java",
    "javascript",
    "hcl",
    "lua",
    "python",
    "rust",
    "scala",
    "tsx",
    "typescript",
  },
  highlight = { enable = true },
  indent = { enable = false },
})
