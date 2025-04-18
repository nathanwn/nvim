local config = function()
  local telescope = require("telescope")
  local keys = require("nathan-wien.keys")

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

  -- local map = function(key, fn, desc)
  --   vim.keymap.set("n", key, fn, { desc = desc })
  -- end

  vim.keymap.set("n", keys.find.files, function()
    require("telescope.builtin").find_files({ hidden = true })
  end, { desc = "Files" })
  vim.keymap.set("n", "<Leader>fb", function()
    require("telescope.builtin").buffers({ previewer = false })
  end, { desc = "Buffers" })
  vim.keymap.set(
    "n",
    "<Leader>fc",
    require("telescope.builtin").current_buffer_fuzzy_find,
    { desc = "Current buffer" }
  )
  vim.keymap.set(
    "n",
    keys.find.grep,
    require("telescope.builtin").live_grep,
    { desc = "Grep" }
  )
  vim.keymap.set("n", "<Leader>fG", function()
    require("telescope.builtin").live_grep({ hidden = true })
  end, { desc = "Grep include hidden" })
  vim.keymap.set(
    "n",
    "<Leader>fh",
    require("telescope.builtin").help_tags,
    { desc = "Help tags" }
  )
  vim.keymap.set(
    "n",
    "<Leader>fk",
    require("telescope.builtin").keymaps,
    { desc = "Keys" }
  )
  vim.keymap.set(
    "n",
    keys.find.commands,
    require("telescope.builtin").commands,
    { desc = "Command" }
  )
  vim.keymap.set(
    "n",
    "<Leader>fp",
    require("telescope.builtin").command_history,
    { desc = "Command history" }
  )
  -- vim.keymap.set("n",
  --   "<Leader>fw",
  --   require("nathanwn.plugins.telescope.handlers").worktrees,
  --   "Worktrees"
  -- )
  vim.keymap.set(
    "n",
    "<Leader>fo",
    require("telescope.builtin").resume,
    { desc = "Resume" }
  )
  vim.keymap.set(
    "n",
    "<Leader>fa",
    require("telescope.builtin").builtin,
    { desc = "Built-ins" }
  )
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    event = "VimEnter",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = config,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
