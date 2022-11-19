local dap = require("dap")
local dap_ui = require("dapui")
local which_key = require("which-key")
local handlers = require("nathan-wien.dap.handlers")

local M = {}

M.setup = function()
  which_key.register({
    d = {
      name = "dap",
      b = { dap.toggle_breakpoint, "toggle breakpoint" },
      c = { dap.toggle_conditional_breakpoint, "toggle conditional breakpoint" },
      g = { dap.continue, "continue" },
      j = { dap.step_into, "step into" },
      k = { dap.step_out, "step out" },
      l = { dap.step_into, "step over" },
      r = { dap.repl.open, "open repl" },
      e = { dap_ui.eval, "ui eval" },
      q = { dap_ui.close, "ui close" },
    },
  }, { prefix = " " })

  for ft, cb in pairs(handlers.test.method) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ft,
      callback = vim.schedule_wrap(function()
        which_key.register({
          d = {
            name = "dap",
            t = { cb, "debug test" },
          },
        }, { prefix = " ", buffer = 0 })
      end),
    })
  end

  for ft, cb in pairs(handlers.test.file) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ft,
      callback = vim.schedule_wrap(function()
        which_key.register({
          d = {
            name = "dap",
            f = { cb, "debug test file" },
          },
        }, { prefix = " ", buffer = 0 })
      end),
      group = vim.api.nvim_create_augroup("dap-ft-" .. ft, { clear = true }),
    })
  end
end

return M
