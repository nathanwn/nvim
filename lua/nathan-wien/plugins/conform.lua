local formatters_by_ft = {
  lua = { "stylua" },
  rust = { "rustfmt" },
  -- Conform will run multiple formatters sequentially
  python = {
    -- "autoflake",
    "isort",
    "black",
  },
  -- Use a sub-list to run only the first available formatter
  javascript = { { "prettierd", "prettier" } },
  typescript = { { "prettierd", "prettier" } },
}

local function format()
  local win = vim.api.nvim_get_current_win()
  local filetype
  vim.api.nvim_win_call(win, function()
    filetype = vim.bo.filetype
  end)
  if vim.tbl_get(formatters_by_ft, filetype) ~= nil then
    require("conform").format({ bufnr = 0 })
    -- elseif filetype == "python" then
    --   vim.cmd("silent !pre-commit run black --files %")
    --   vim.cmd("silent !pre-commit run isort --files %")
  end
end

return {
  "stevearc/conform.nvim",
  version = "v6.0.0",
  config = function()
    require("conform").setup({
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 3000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = formatters_by_ft,
      formatters = {
        autoflake = {
          prepend_args = { "--remove-all-unused-imports" },
        },
      },
    })
    vim.api.nvim_create_user_command("F", format, {})
  end,
}
