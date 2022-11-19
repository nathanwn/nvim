local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
local lrequire = require("nathan-wien.utils").local_require

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  -- Packer manages itself
  use({ "wbthomason/packer.nvim" })

  -- UTILITIES
  -- Core plugins
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })
  -- Git
  use({
    "tpope/vim-fugitive",
    event = "VimEnter *",
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    tag = "release",
  })
  use({
    "ThePrimeagen/git-worktree.nvim",
  })
  -- Tmux
  use({
    "christoomey/vim-tmux-navigator",
    -- event = 'VimEnter *',
  })
  -- Undo
  use({
    "mbbill/undotree",
    -- cmd = { "UndotreeToggle" },
  })
  -- Outline
  use({
    "simrat39/symbols-outline.nvim",
    -- cmd = { "SymbolsOutline" },
  })
  -- Explorer Tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    -- cmd = { "NvimTreeToggle" },
  })
  -- Colorizer
  use({ "chrisbra/Colorizer" })
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    "nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  -- Docstring
  use({
    "kkoomen/vim-doge",
    run = ":call doge#install()",
  })
  use({
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    tag = "2.8.0",
  })
  -- Grammar checker
  use({ "rhysd/vim-grammarous" })

  -- THEMES
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "NLKNguyen/papercolor-theme",
    -- "~/work/neovim/plugins/papercolor-theme.git/branches/???",
    as = "papercolor-theme",
    requires = { "nvim-lualine/lualine.nvim" },
    config = lrequire("themes/papercolor-light"),
  })
  use({
    "joshdick/onedark.vim",
    requires = { "nvim-lualine/lualine.nvim" },
    -- config = lrequire("themes/onedark"),
  })
  use({
    "sainnhe/gruvbox-material",
    -- config = lrequire("themes/gruvbox-material"),
  })
  use({
    "rafamadriz/neon",
    requires = { "nvim-lualine/lualine.nvim" },
    -- config = lrequire("themes/neon"),
  })
  -- use({
  --   "sainnhe/sonokai",
  --   config = lrequire("themes/solokai"),
  -- })
  -- use({ "rktjmp/lush.nvim" })

  -- FUZZY-FINDING
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- LSP
  -- LspConfig
  use({
    "neovim/nvim-lspconfig",
    config = lrequire("lsp"),
  })
  -- Installer
  use({
    "williamboman/mason.nvim",
    requires = {
      { "williamboman/mason-lspconfig.nvim" },
    },
  })
  -- Formatting & Linting
  use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
  -- UI
  use({
    "folke/trouble.nvim",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "folke/lsp-colors.nvim" },
    },
  })
  use({
    "folke/lsp-colors.nvim",
    -- config = lrequire("plugins/lsp-colors"),
  })
  -- Java
  use({
    "mfussenegger/nvim-jdtls",
    -- config = lrequire("lsp.servers.jdtls"),
    -- ft = { "java" },
  })
  -- Rust
  use({
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig" },
  })
  -- Scala
  use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

  -- DAP
  use({ "mfussenegger/nvim-dap" })
  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = lrequire("dap/ui"),
  })
  use({
    "nvim-telescope/telescope-dap.nvim",
    requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
  })
  use({
    "mfussenegger/nvim-dap-python",
    requires = { "mfussenegger/nvim-dap" },
    config = lrequire("dap/python"),
  })
  use({
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
    config = lrequire("dap/virtual-text"),
  })
  use({
    "leoluz/nvim-dap-go",
    config = lrequire("dap/go"),
  })

  -- AUTOCOMPLETE
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-omni" },
      { "saadparwaiz1/cmp_luasnip" },
      -- Appearance
      { "onsails/lspkind.nvim" },
    },
  })
  -- Snippets
  use({ "L3MON4D3/LuaSnip" })

  -- LANGUAGE-SPECIFIC
  -- TS, React
  use({ "leafgarland/typescript-vim" })
  use({ "peitalin/vim-jsx-typescript" })
  -- Emmet
  use({ "mattn/emmet-vim" })
  -- Markdown
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  -- Nix
  -- use({ "LnL7/vim-nix", ft = { "nix" } })
  -- Pandoc
  -- use({
  --   "vim-pandoc/vim-pandoc",
  --   requires = { "vim-pandoc/vim-pandoc-syntax" },
  --   ft = { "pandoc" },
  -- })
  -- Prisma
  use({ "pantharshit00/vim-prisma", ft = { "prisma" } })
  -- Tex
  use({ "lervag/vimtex", ft = { "tex" } })

  -- Auto-install
  if packer_bootstrap then
    require("packer").sync()
  end
end)
