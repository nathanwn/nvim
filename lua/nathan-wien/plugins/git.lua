return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- git diff select left/right
      vim.keymap.set(
        "n",
        "<Leader>h<",
        "<cmd>diffget //2<CR>",
        { desc = "Get left (ours)" }
      )
      vim.keymap.set(
        "n",
        "<Leader>h>",
        "<cmd>diffget //3<CR>",
        { desc = "Get right (theirs)" }
      )
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v0.9.0",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = {
            text = "▌", -- │
          },
          change = {
            text = "▌", -- │
          },
          delete = {
            text = "_",
          },
          topdelete = {
            text = "‾",
          },
          changedelete = {
            text = "~",
          },
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gs.nav_hunk("next")
            end
          end, { desc = "next hunk" })

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gs.nav_hunk("prev")
            end
          end, { desc = "prev hunk" })

          -- Actions
          map({ "n", "v" }, "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
          map({ "n", "v" }, "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, {
            desc = "blame line",
          })
        end,
      })
    end,
  },
}
