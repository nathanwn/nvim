vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = false
vim.g.vimtex_mappings_enabled = false
vim.g.vimtex_log_ignore = {
  "Underfull",
  "Overfull",
  "specifier changed to",
  "Token not allowed in a PDF string",
}
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  background = 1,
  build_dir = ".",
  callback = 1,
  continuous = true,
  executable = "latexmk",
  options = {
    "-pdf",
    "-verbose",
    "-shell-escape",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
}
vim.g.vimtex_compiler_progname = require("nathan-wien.utils").python_venv .. "/bin/nvr"
vim.api.nvim_set_keymap("n", "<F9>", "<Cmd>VimtexCompile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F10>", "<Cmd>VimtexView<CR>", { noremap = true })
