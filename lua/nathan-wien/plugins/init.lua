-- Bootstrap.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UTILITIES
  -- Core plugins
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Git
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v0.6",
  },
  { "ThePrimeagen/git-worktree.nvim" },
  -- Tmux
  { "christoomey/vim-tmux-navigator" },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("nathan-wien.plugins.harpoon").config,
  },
  -- Undo
  { "mbbill/undotree" },
  -- Outline
  { "simrat39/symbols-outline.nvim" },
  -- Explorer Tree
  {
    "kyazdani42/nvim-tree.lua",
    version = "nightly",
  },
  -- Keybindings
  { "folke/which-key.nvim" },
  -- Colorizer
  { "chrisbra/Colorizer" },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  -- Docstring
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    version = "2.10.3",
  },
  -- Grammar checker
  { "rhysd/vim-grammarous" },
  -- Startup time
  { "dstein64/vim-startuptime" },

  -- THEMES
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "catppuccin",
      "SmiteshP/nvim-navic",
    },
    config = require("nathan-wien.plugins.heirline").config,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = require("nathan-wien.plugins.catppuccin").config,
  },
  { "NLKNguyen/papercolor-theme" },
  -- FUZZY-FINDING
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    branch = "0.1.x",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  -- LSP
  -- LspConfig
  { "neovim/nvim-lspconfig" },
  -- Installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  -- Formatting & Linting
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- UI
  { "folke/lsp-colors.nvim" },
  { "j-hui/fidget.nvim" },
  {
    "SmiteshP/nvim-navic",
    config = require("nathan-wien.plugins.navic").config,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = require("nathan-wien.plugins.lsp-inlayhints").config,
  },
  -- Java
  { "mfussenegger/nvim-jdtls" },
  -- Rust
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  -- Scala
  { "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim" } },

  -- DAP
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    version = "v2.6.0",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  { "leoluz/nvim-dap-go" },

  -- AUTOCOMPLETE
  {
    "hrsh7th/nvim-cmp",
    version = "v0.0.1",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-omni" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "saadparwaiz1/cmp_luasnip" },
      -- Appearance
      { "onsails/lspkind.nvim" },
    },
  },
  -- Snippets
  { "L3MON4D3/LuaSnip", version = "v1.1.0" },

  -- LANGUAGE-SPECIFIC
  -- TS, React
  { "leafgarland/typescript-vim" },
  { "peitalin/vim-jsx-typescript" },
  -- Tex
  {
    "lervag/vimtex",
    version = "v2.11",
  },
  -- ANTLR4
  { "dylon/vim-antlr" },
  -- Lark
  { "lark-parser/vim-lark-syntax" },
  -- Emmet
  -- { "mattn/emmet-vim" }
  -- Markdown
  { "preservim/vim-markdown", ft = { "markdown" } },
  {
    "iamcco/markdown-preview.nvim",
    version = "v0.0.10",
  },
  -- Pandoc
  -- {
  --   "vim-pandoc/vim-pandoc",
  --   dependencies = { "vim-pandoc/vim-pandoc-syntax" },
  --   ft = { "pandoc" },
  -- }

  -- Tools
  {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})
