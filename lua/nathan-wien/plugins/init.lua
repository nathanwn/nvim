local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Packer manages itself
  use({ "wbthomason/packer.nvim" })

  -- UTILITIES
  -- Core plugins
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  -- Git
  use({ "tpope/vim-fugitive" })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    tag = "v0.5",
  })
  use({ "ThePrimeagen/git-worktree.nvim" })
  -- Tmux
  use({ "christoomey/vim-tmux-navigator" })
  -- Harpoon
  use({ "ThePrimeagen/harpoon" })
  -- Undo
  use({ "mbbill/undotree" })
  -- Outline
  use({ "simrat39/symbols-outline.nvim" })
  -- Explorer Tree
  use({
    "kyazdani42/nvim-tree.lua",
    tag = "nightly",
  })
  -- Keybindings
  use({ "folke/which-key.nvim" })
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
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    tag = "2.8.1",
  })
  -- Grammar checker
  use({ "rhysd/vim-grammarous" })
  -- Startup time
  use({ "lewis6991/impatient.nvim" })
  use({ "dstein64/vim-startuptime" })

  -- THEMES
  use({ "nvim-lualine/lualine.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "NLKNguyen/papercolor-theme" })
  -- FUZZY-FINDING
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    branch = "0.1.x",
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
      .. "&& cmake --build build --config Release "
      .. "&& cmake --install build --prefix build'",
  })

  -- LSP
  -- LspConfig
  use({ "neovim/nvim-lspconfig" })
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
  use({ "folke/lsp-colors.nvim" })
  use({ "j-hui/fidget.nvim" })
  use({ "SmiteshP/nvim-navic" })
  -- Java
  use({ "mfussenegger/nvim-jdtls" })
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
    tag = "v2.6.0",
  })
  use({
    "nvim-telescope/telescope-dap.nvim",
    requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
  })
  use({
    "mfussenegger/nvim-dap-python",
    requires = { "mfussenegger/nvim-dap" },
  })
  use({
    "theHamsta/nvim-dap-virtual-text",
    commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4",
    requires = { "mfussenegger/nvim-dap" },
  })
  use({ "leoluz/nvim-dap-go" })

  -- AUTOCOMPLETE
  use({
    "hrsh7th/nvim-cmp",
    tag = "v0.0.1",
    requires = {
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
  })
  -- Snippets
  use({ "L3MON4D3/LuaSnip", tag = "v1.1.0" })

  -- LANGUAGE-SPECIFIC
  -- TS, React
  use({ "leafgarland/typescript-vim" })
  use({ "peitalin/vim-jsx-typescript" })
  -- Tex
  use({
    "lervag/vimtex",
    tag = "v2.11",
  })
  -- ANTLR4
  use({ "dylon/vim-antlr" })
  -- Lark
  use({ "lark-parser/vim-lark-syntax" })
  -- Emmet
  -- use({ "mattn/emmet-vim" })
  -- Markdown
  use({ "preservim/vim-markdown", ft = { "markdown" } })
  use({
    "iamcco/markdown-preview.nvim",
    tag = "v0.0.10",
  })
  -- Pandoc
  -- use({
  --   "vim-pandoc/vim-pandoc",
  --   requires = { "vim-pandoc/vim-pandoc-syntax" },
  --   ft = { "pandoc" },
  -- })

  -- Auto-install
  if packer_bootstrap then
    require("packer").sync()
  end
end)
