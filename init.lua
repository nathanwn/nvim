local global_theme = vim.env.GLOBAL_THEME

local keys = {
  diagnostic = {
    prev = "[d",
    next = "]d",
  },
  find = {
    command_history = "<Leader>fP",
    commands = "<Leader>f;",
    files = "<Leader>ff",
    git_files = "<Leader>fp",
    git_grep = "<Leader>fg",
    grep = "<Leader>fG",
    help_tags = "<Leader>fh",
    resume = "<Leader>fo",
  },
  git = {
    hunk = {
      preview = "<Leader>hp",
      reset = "<Leader>hr",
      stage = "<Leader>hs",
      undo_stage = "<Leader>hu",
      -- nav
      prev = "[c",
      next = "]c",
    },
  },
  lsp = {
    code_actions = "<Leader>ga",
    definition = "<Leader>gd",
    declaration = "<Leader>gD",
    implementation = "<Leader>gi",
    hover = "<Leader>gk",
    signature_help = "<C-k>",
    rename = "<Leader>gr",
    type_definition = "<Leader>gt",
    usages = "<Leader>gu",
    line_diagnostic = "<Leader>gl",
    inlay_hint_toggle = "<Leader>gn",
  },
  quickfix = {
    prev = "[q",
    next = "]q",
  },
  view = {
    filetree = "<Leader>ve",
  },
}

local os_uname = vim.loop.os_uname()
local os_name = os_uname.sysname
local os_release = os_uname.release
local is_on_windows = (string.find(string.lower(os_name), "windows") ~= nil)
local is_on_linux = (os_name == "Linux")
local is_on_mac = (os_name == "Darwin")
local is_on_wsl2 = (is_on_linux and string.find(os_release, "WSL2") ~= nil)
_ = is_on_mac
_ = is_on_wsl2

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Indentation
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- Characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "␣",
  extends = "▶",
  precedes = "◀",
  -- eol = "⏎",
}
vim.opt.fillchars = {
  -- Remove the tilde symbols at the end of buffers
  eob = " ",
  -- For folding
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
}
-- Error bells
vim.opt.errorbells = false
-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Scrolling
vim.opt.scrolloff = 8
-- Undo files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fs.joinpath(vim.fn.stdpath("data"), "undodir")
vim.opt.undofile = true
-- Wrap
vim.opt.linebreak = true
-- Highlight search
vim.opt.hlsearch = false
-- Cursor
vim.opt.guicursor = ""
-- Mouse -- useful for resizing splits
vim.opt.mouse = "a"
-- Load project-wise vim settings
vim.opt.exrc = true
-- Backspace issue
vim.opt.backspace = { "indent", "eol", "start" }
-- Clipboard
vim.opt.clipboard = { "unnamed", "unnamedplus" }
-- Termcolor
vim.opt.termguicolors = true
-- Buffers
vim.opt.hidden = true
-- Latex
vim.g.tex_flavor = "latex"
-- Syntax-highlight lua in vimscript
vim.g.vimsyn_embed = "l"
-- Increases signcolumn width for gitsigns and diagnostics
vim.opt.signcolumn = "auto:2"
-- Global status bar
vim.opt.laststatus = 3

vim.api.nvim_create_user_command("NL", function()
  -- CRLF to LF
  vim.cmd([[%s/\r\n/\r/e]])
  -- Trailing whitespaces
  vim.cmd([[%s/ *$//e]])
end, {})

-- Leader keys
vim.g.mapleader = vim.keycode("<Space>")
vim.g.maplocalleader = vim.keycode("<Space>")

-- Reload init.lua
-- vim.keymap.set("n", "<F12>", ":luafile ~/.config/nvim/init.lua<CR>")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Quickfix list
vim.keymap.set("n", keys.quickfix.prev, "<cmd>cprevious<CR>")
vim.keymap.set("n", keys.quickfix.next, "<cmd>cnext<CR>")

-- Smart dd. Credit: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true })

-- Some magic from: https://github.com/ThePrimeagen/init.lua
-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the same position while doing line-appending
vim.keymap.set("n", "J", "mzJ`z")

-- Center the cursor vertically when using C-u/d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the cursor vertically when navigating through search results
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Paste over a selection without losing the paste register
vim.keymap.set("x", "<Leader>p", [["_dP]])

-- Copy path to current file to clipboard
vim.keymap.set("n", "\\cp", function ()
  vim.cmd("let @+=expand(\"%:p\")")
  vim.notify("Copied current file path to clipboard.")
end)

-- Filtering quickfix
vim.cmd.packadd("cfilter")

vim.filetype.add({
  extension = {
    facts = "soufflefacts",
    dl = "souffle",
    gradle = "groovy.gradle",
    i3config = "i3config",
    souffle = "souffle",
    tex = "tex",
    tmux = "tmux",
    tsx = "typescriptreact",
    ts = "typescript",
  },
  filename = {
    [".flake8"] = "cfg",
    ["Jenkinsfile"] = "groovy",
    [".envrc"] = "bash",
    [".pre-commit-config.yaml"] = "yaml",
  },
  pattern = {
    ["*.clang-format"] = "yaml",
    ["gitconfig"] = "gitconfig",
    ["*.gitconfig"] = "gitconfig",
  },
})

-- Bootstrap lazy.nvim
local lazypath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local hunk_keys = keys.git.hunk

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        local next_hunk = function()
          if vim.wo.diff then
            vim.cmd.normal({ hunk_keys.next, bang = true })
          else
            gs.nav_hunk("next")
          end
        end
        local prev_hunk = function()
          if vim.wo.diff then
            vim.cmd.normal({ hunk_keys.prev, bang = true })
          else
            gs.nav_hunk("prev")
          end
        end

        map("n", hunk_keys.next, next_hunk, "next hunk")
        map("n", hunk_keys.prev, prev_hunk, "prev hunk")
        map("n", hunk_keys.preview, gs.preview_hunk, "preview hunk")
        map({ "n", "v" }, hunk_keys.reset, gs.reset_hunk, "reset hunk")
        map({ "n", "v" }, hunk_keys.stage, gs.stage_hunk, "stage hunk")
        map("n", hunk_keys.undo_stage, gs.undo_stage_hunk, "undo stage hunk")
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local theme = "auto"
      if global_theme == "papercolor-light" then
        theme = "papercolor_light"
      elseif global_theme == "tokyonight-storm" then
        theme = "tokyonight"
      elseif global_theme == "solarized-dark" then
        theme = "solarized-dark"
      elseif global_theme == "nvim-light" then
        theme = "Tomorrow"
      end
      require("lualine").setup({
        options = {
          theme = theme,
          section_separators = "",
          component_separators = "",
          icons_enabled = false,
          disabled_filetypes = { "NvimTree", "qf" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "diagnostics" },
          lualine_x = { "lsp_status" },
          lualine_y = { "encoding", "fileformat", "filetype" },
          lualine_z = { "location" },
        },
        winbar = {
          lualine_c = {
            { "filename", path = 1 },
          },
        },
        inactive_winbar = {
          lualine_c = {
            { "filename", path = 1 },
          },
        },
        extensions = {},
      })
    end,
  },
  {
    "https://github.com/plan9-for-vimspace/plan9-for-vimspace",
    cond = not is_on_windows,
  },
  {
    "https://github.com/NMAC427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "https://github.com/christoomey/vim-tmux-navigator",
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<C-w>h", "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-w>j", "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-w>k", "<Cmd>TmuxNavigateUp<CR>" },
      { "<C-w>l", "<Cmd>TmuxNavigateRight<CR>" },
      { "<C-w>\\", "<Cmd>TmuxNavigatePrevious<CR>" },
    },
  },
  {
    "https://github.com/saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    opts = {
      keymap = { preset = "super-tab" },
      sources = { default = { "lsp", "path" } },
      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      -- Use the Lua implementation instead.
      -- May enable the rust implementation via `'prefer_rust_with_warning'`
      -- See :h blink-cmp-config-fuzzy.
      fuzzy = { implementation = "lua" },
    },
  },
  {
    "https://github.com/ibhagwan/fzf-lua",
    config = function()
      local fzf_lua = require("fzf-lua")
      fzf_lua.setup({ "telescope" })
      vim.keymap.set("n", keys.find.git_files, fzf_lua.git_files, {})
      vim.keymap.set("n", keys.find.files, fzf_lua.files, {})
      vim.keymap.set("n", keys.find.git_grep, function()
        fzf_lua.live_grep({
          cmd = "git grep --line-number --column --color=always",
        })
      end, {})
      vim.keymap.set("n", keys.find.grep, fzf_lua.grep, {})
      vim.keymap.set("n", keys.find.resume, fzf_lua.resume, {})
      vim.keymap.set("n", keys.find.commands, fzf_lua.commands, {})
      vim.keymap.set("n", keys.find.help_tags, fzf_lua.help_tags, {})
    end,
  },
  {
    "https://github.com/mason-org/mason.nvim",
    cond = not is_on_windows,
    tag = "v2.0.1",
    cmd = "Mason",
    opts = {},
  },
  {
    "https://github.com/neovim/nvim-lspconfig",
    cond = not is_on_windows,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "https://github.com/mason-org/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      { "https://github.com/j-hui/fidget.nvim" },
      { "https://github.com/saghen/blink.cmp" },
    },
    config = function()
      local lsp_create_on_attach = function(opts)
        opts = opts or {}
        return function(client, bufnr)
          if opts.pre_attach then
            opts.pre_attach(client, bufnr)
          end
          if not opts.formatting then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end
      end

      local default_config = {
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = require("blink.cmp").get_lsp_capabilities({}),
        on_attach = lsp_create_on_attach({}),
      }

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
                -- Ignore Lua_LS's noisy `missing-fields` warnings
                disable = { "missing-fields" },
              },
            },
          },
          on_attach = lsp_create_on_attach({ formatting = false }),
        },
        pyright = {},
        gopls = {},
      }

      for name, config in pairs(servers) do
        require("lspconfig")[name].setup(
          vim.tbl_deep_extend("force", default_config, config)
        )
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
        callback = function(event)
          local nmap = function(key, func, desc)
            vim.keymap.set("n", key, func, { buffer = event.buf, desc = desc })
          end
          nmap(keys.lsp.definition, vim.lsp.buf.definition, "definition")
          nmap(keys.lsp.declaration, vim.lsp.buf.declaration, "declaration")
          nmap(keys.lsp.implementation, vim.lsp.buf.implementation, "implementation")
          nmap(keys.lsp.usages, vim.lsp.buf.references, "usages")
          nmap(keys.lsp.type_definition, vim.lsp.buf.type_definition, "type definition")
          nmap(keys.lsp.rename, vim.lsp.buf.rename, "rename")
          nmap(keys.lsp.code_actions, vim.lsp.buf.code_action, "code action")
          nmap(keys.lsp.hover, vim.lsp.buf.hover, "hover documentation")
          nmap(keys.lsp.signature_help, vim.lsp.buf.signature_help, "signature help")
          nmap(keys.lsp.line_diagnostic, vim.diagnostic.open_float, "line diagnostic")
          nmap(keys.diagnostic.prev, function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, "prev diagnostic")
          nmap(keys.diagnostic.next, function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, "next diagnostic")
          nmap("<Leader>g*", function()
            vim.cmd("e" .. vim.lsp.get_log_path())
          end, "get log path")
        end,
      })
    end,
  },
  {
    "https://github.com/j-hui/fidget.nvim",
    cond = not is_on_windows,
    tag = "v1.6.1",
    opts = {},
  },
  {
    "https://github.com/stevearc/conform.nvim",
    version = "v9.0.0",
    config = function()
      require("conform").setup({
        notify_on_error = false,
        formatters_by_ft = {
          cpp = { "clang-format" },
          go = { "gofmt" },
          lua = { "stylua" },
          rust = { "rustfmt" },
          -- Run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
        },
      })
      vim.api.nvim_create_user_command("F", function()
        require("conform").format({ bufnr = 0 })
      end, {})
    end,
  },
  {
    "https://github.com/nvim-tree/nvim-tree.lua.git",
    version = "v1.13.0",
    opts = {
      renderer = {
        add_trailing = true,
        group_empty = true,
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false,
          },
        },
      },
    },
    keys = {
      {
        keys.view.filetree,
        "<cmd>NvimTreeToggle<CR>",
        mode = "n",
        desc = "Toggle file tree",
      },
    },
  },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    cond = (global_theme == "solarized-dark"),
    config = function()
      require('solarized').setup({})
      vim.cmd.colorscheme('solarized')
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    cond = (global_theme == "tokyonight-storm"),
    opts = {},
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("tokyonight-storm")
    end,
  },
  {
    "https://github.com/pappasam/papercolor-theme-slim",
    lazy = false,
    cond = (global_theme == "papercolor-light"),
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("PaperColorSlimLight")
    end,
  },
})

if global_theme == "nvim-light" then
  vim.o.background = "light"
  vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = '#aacccc'})
end
