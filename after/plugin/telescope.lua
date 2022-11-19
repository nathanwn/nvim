local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    file_ignore_patterns = {
      ".git/",
      "__pycache__",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor({}),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("dap")
telescope.load_extension("git_worktree")
telescope.load_extension("ui-select")

vim.keymap.set("n", "<Leader>ff", function()
  telescope_builtin.find_files({ hidden = true })
end, { desc = "[telescope] Find files" })
vim.keymap.set("n", "<Leader>fb", function()
  telescope_builtin.buffers({ previewer = false })
end, { desc = "[telescope] List buffers" })
vim.keymap.set(
  "n",
  "<Leader>fc",
  telescope_builtin.current_buffer_fuzzy_find,
  { desc = "[telescope] Find in current buffer" }
)
vim.keymap.set(
  "n",
  "<Leader>fg",
  telescope_builtin.live_grep,
  { desc = "[telescope] Live grep" }
)
vim.keymap.set("n", "<Leader>fG", function()
  telescope_builtin.live_grep({ hidden = true })
end, { desc = "[telescope] Live grep (hidden files included)" })
vim.keymap.set(
  "n",
  "<Leader>fh",
  telescope_builtin.help_tags,
  { desc = "[telescope] List help tags" }
)
vim.keymap.set(
  "n",
  "<Leader>fk",
  telescope_builtin.keymaps,
  { desc = "[telescope] List keymappings" }
)
vim.keymap.set("n", "<Leader>f.", function()
  telescope_builtin.find_files({
    cwd = vim.fn.getenv("HOME") .. "/dotfiles",
    hidden = true,
  })
end, { desc = "[telescope] Find in dotfiles" })
vim.keymap.set(
  "n",
  "<Leader>fw",
  telescope.extensions.git_worktree.git_worktrees,
  { desc = "[telescope] List worktrees" }
)
