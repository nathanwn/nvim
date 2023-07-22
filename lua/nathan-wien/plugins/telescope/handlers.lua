local telescope_builtin = require("telescope.builtin")

return {
  files = function()
    telescope_builtin.find_files({ hidden = true })
  end,
  buffers = function()
    telescope_builtin.buffers({ previewer = false })
  end,
  current_buffer = telescope_builtin.current_buffer_fuzzy_find,
  grep = telescope_builtin.live_grep,
  grep_include_hidden = function()
    telescope_builtin.live_grep({ hidden = true })
  end,
  help_tags = telescope_builtin.help_tags,
  keys = telescope_builtin.keymaps,
  dotfiles = function()
    telescope_builtin.find_files({
      cwd = string.format("%s/dev/personal/nvim/.config/nvim", vim.fn.getenv("HOME")),
      hidden = true,
    })
  end,
  -- worktrees = telescope.extensions.git_worktree.git_worktrees,
  resume = telescope_builtin.resume,
  builtin = telescope_builtin.builtin,
  command_history = telescope_builtin.command_history,
}
