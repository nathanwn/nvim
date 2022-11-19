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

local handlers = {
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
      cwd = vim.fn.getenv("HOME") .. "/dotfiles",
      hidden = true,
    })
  end,
  worktrees = telescope.extensions.git_worktree.git_worktrees,
  resume = telescope_builtin.resume,
}

local set_key = function(mode, key, handler, desc)
  vim.keymap.set(mode, key, handler, { desc = "[telescope] " .. desc })
end

set_key("n", "<Leader>ff", handlers.files, "Files")
set_key("n", "<Leader>fb", handlers.buffers, "Buffers")
set_key("n", "<Leader>fc", handlers.current_buffer, "Current buffer")
set_key("n", "<Leader>fg", handlers.grep, "Grep")
set_key("n", "<Leader>fG", handlers.grep_include_hidden, "Grep include hidden")
set_key("n", "<Leader>fh", handlers.help_tags, "Help tags")
set_key("n", "<Leader>fk", handlers.keys, "Keys")
set_key("n", "<Leader>f.", handlers.dotfiles, "Dotfiles")
set_key("n", "<Leader>fw", handlers.worktrees, "Worktrees")
set_key("n", "<Leader>fo", handlers.resume, "Resume")
