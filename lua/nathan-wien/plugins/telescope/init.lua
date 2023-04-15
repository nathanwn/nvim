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
    version = "v0.1.1",
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
        "Files",
      },
      {
        "<Leader>fb",
        require("nathan-wien.plugins.telescope.handlers").buffers,
        "Buffers",
      },
      {
        "<Leader>fc",
        require("nathan-wien.plugins.telescope.handlers").current_buffer,
        "Current buffer",
      },
      {
        "<Leader>fg",
        require("nathan-wien.plugins.telescope.handlers").grep,
        "Grep",
      },
      {
        "<Leader>fG",
        require("nathan-wien.plugins.telescope.handlers").grep_include_hidden,
        "Grep include hidden",
      },
      {
        "<Leader>fh",
        require("nathan-wien.plugins.telescope.handlers").help_tags,
        "Help tags",
      },
      {
        "<Leader>fk",
        require("nathan-wien.plugins.telescope.handlers").keys,
        "Keys",
      },
      {
        "<Leader>f.",
        require("nathan-wien.plugins.telescope.handlers").dotfiles,
        "Dotfiles",
      },
      -- {
      --   "<Leader>fw",
      --   require("nathan-wien.plugins.telescope.handlers").worktrees,
      --   "Worktrees",
      -- },
      {
        "<Leader>fo",
        require("nathan-wien.plugins.telescope.handlers").resume,
        "Resume",
      },
      {
        "<Leader>fa",
        require("nathan-wien.plugins.telescope.handlers").builtin,
        "Resume",
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
