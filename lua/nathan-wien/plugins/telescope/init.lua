-- local handlers = require("nathan-wien.plugins.telescope.handlers")

local config = function()
  local telescope = require("telescope")

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
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = config,
    keys = {
      {
        "<Leader>ff",
        require("nathan-wien.plugins.telescope.handlers").files,
        desc = "Files",
      },
      {
        "<Leader>fb",
        require("nathan-wien.plugins.telescope.handlers").buffers,
        desc = "Buffers",
      },
      {
        "<Leader>fc",
        require("nathan-wien.plugins.telescope.handlers").current_buffer,
        desc = "Current buffer",
      },
      {
        "<Leader>fg",
        require("nathan-wien.plugins.telescope.handlers").grep,
        desc = "Grep",
      },
      {
        "<Leader>fG",
        require("nathan-wien.plugins.telescope.handlers").grep_include_hidden,
        desc = "Grep include hidden",
      },
      {
        "<Leader>fh",
        require("nathan-wien.plugins.telescope.handlers").help_tags,
        desc = "Help tags",
      },
      {
        "<Leader>fk",
        require("nathan-wien.plugins.telescope.handlers").keys,
        desc = "Keys",
      },
      {
        "<Leader>f.",
        require("nathan-wien.plugins.telescope.handlers").dotfiles,
        desc = "Dotfiles",
      },
      {
        "<Leader>f;",
        require("nathan-wien.plugins.telescope.handlers").commands,
        desc = "Command history",
      },
      {
        "<Leader>fp",
        require("nathan-wien.plugins.telescope.handlers").command_history,
        desc = "Command history",
      },
      -- {
      --   "<Leader>fw",
      --   require("nathan-wien.plugins.telescope.handlers").worktrees,
      --   "Worktrees",
      -- },
      {
        "<Leader>fo",
        require("nathan-wien.plugins.telescope.handlers").resume,
        desc = "Resume",
      },
      {
        "<Leader>fa",
        require("nathan-wien.plugins.telescope.handlers").builtin,
        desc = "Built-ins",
      },
    },
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
