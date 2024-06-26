return {
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v0.6",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = "▌", -- │
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = "▌", -- │
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "_",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
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
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "next hunk" })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "prev hunk" })

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
          -- map("n", "<leader>tb", gs.toggle_current_line_blame)
          -- map("n", "<leader>hd", gs.diffthis)
          -- map("n", "<leader>hD", function()
          --   gs.diffthis("~")
          -- end)
          -- map("n", "<leader>td", gs.toggle_deleted)

          -- -- Text object
          -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },
}
