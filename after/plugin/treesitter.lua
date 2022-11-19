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
    "nix",
    "python",
    "query", -- this is required for query in TSPlayground to work
    "rst",
    "rust",
    "scala",
    -- "souffle", -- this has to be installed via :TSInstallFromGrammar due to outdated ABI version
    "tsx",
    "typescript",
  },
  highlight = { enable = true },
  indent = { enable = false },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.souffle = {
  install_info = {
    url = "https://github.com/nathan-wien/tree-sitter-souffle", -- local path or git repo
    files = { "src/parser.c" },
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- false if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- false if folder contains pre-generated src/parser.c
  },
  filetype = "souffle", -- if filetype does not match the parser name
}
