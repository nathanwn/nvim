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
    config = lrequire("plugins/fugitive"),
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = lrequire("plugins/gitsigns"),
  })
  use({
    "ThePrimeagen/git-worktree.nvim",
    config = lrequire("plugins/git-worktree"),
  })
  -- Tmux
  use({
    "christoomey/vim-tmux-navigator",
    -- event = 'VimEnter *',
    config = lrequire("plugins/tmux-navigator"),
  })
  -- Undo
  use({
    "mbbill/undotree",
    config = lrequire("plugins/undotree"),
    cmd = { "UndotreeToggle" },
  })
  -- Outline
  use({
    "simrat39/symbols-outline.nvim",
    config = lrequire("plugins/outline"),
    cmd = { "SymbolsOutline" },
  })
  -- Explorer Tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = lrequire("plugins/nvim-tree"),
    cmd = { "NvimTreeToggle" },
  })
  -- Colorizer
  use({ "chrisbra/Colorizer" })
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = lrequire("plugins/treesitter"),
  })
  use({
    "nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = lrequire("plugins/treesitter-playground"),
  })
  -- Docstring
  use({
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = lrequire("plugins/vim-doge"),
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
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
    },
    config = lrequire("plugins/telescope"),
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
    "williamboman/nvim-lsp-installer",
    config = function() end,
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
    config = lrequire("plugins/trouble"),
  })
  use({
    "folke/lsp-colors.nvim",
    config = lrequire("plugins/lsp-colors"),
  })
  -- Rust
  use({
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = lrequire("plugins/rust-tools"),
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
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-omni" },
      -- Snippets
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = lrequire("plugins/cmp"),
  })

  -- LANGUAGE-SPECIFIC
  -- TS, React
  use({ "leafgarland/typescript-vim" })
  use({ "peitalin/vim-jsx-typescript" })
  -- Emmet
  use({ "mattn/emmet-vim" })
  -- Markdown
  use({ "plasticboy/vim-markdown", ft = { "markdown" } })
  -- Nix
  use({ "LnL7/vim-nix", ft = { "nix" } })
  -- Pandoc
  use({
    "vim-pandoc/vim-pandoc",
    requires = { "vim-pandoc/vim-pandoc-syntax" },
    config = lrequire("plugins/vim-pandoc"),
  })
  -- Prisma
  use({ "pantharshit00/vim-prisma", ft = { "prisma" } })
  -- Tex
  use({ "lervag/vimtex", ft = { "tex" } })

  -- Auto-install
  if packer_bootstrap then
    require("packer").sync()
  end
end)
