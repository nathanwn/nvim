local formatters_by_ft = {
  lua = { "stylua" },
  rust = { "rustfmt" },
  -- Conform will run multiple formatters sequentially
  -- python = { "isort", "black" },
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
  elseif filetype == "python" then
    vim.cmd("silent !pre-commit run black --files %")
    vim.cmd("silent !pre-commit run isort --files %")
  end
end

return {
  "stevearc/conform.nvim",
  version = "v5.3.0",
  config = function()
    require("conform").setup({
      formatters_by_ft = formatters_by_ft,
    })
    vim.api.nvim_create_user_command("F", format, {})
  end,
}
