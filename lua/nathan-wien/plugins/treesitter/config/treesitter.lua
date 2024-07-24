local function get_tree_sitter_souffle_repo()
  local tree_sitter_souffle_local_repo =
    vim.fs.joinpath(vim.env.HOME, "dev", "personal", "tree-sitter-souffle")
  if vim.fn.isdirectory(tree_sitter_souffle_local_repo) ~= 0 then
    return tree_sitter_souffle_local_repo
  end
  return "https://github.com/nathanwn/tree-sitter-souffle"
end

return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      -- "bash",  -- bug with the @(..|..|..) pattern
      "c",
      "cpp",
      "cue",
      "dockerfile",
      "go",
      "java",
      "javascript",
      "json",
      "groovy",
      "hcl",
      "kotlin",
      "lua",
      "markdown",
      "nix",
      "python",
      "query", -- this is required for query in TSPlayground to work
      "rst",
      "rust",
      "scala",
      -- "souffle",
      "tsx",
      "typescript",
      "vimdoc",
    },
    highlight = { enable = true },
    indent = { enable = false },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.souffle = {
    install_info = {
      url = get_tree_sitter_souffle_repo(),
      -- other implementations:
      -- https://github.com/julienhenry/tree-sitter-souffle -- Note: outdated ABI version (Dec. 2022).
      -- https://github.com/langston-barrett/tree-sitter-souffle
      files = {
        "src/parser.c",
        "src/scanner.c",
      },
      -- optional entries:
      branch = "main", -- default branch in case of git repo if different from master
      generate_requires_npm = false, -- false if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false, -- false if folder contains pre-generated src/parser.c
    },
    filetype = "souffle", -- if filetype does not match the parser name
  }
end
