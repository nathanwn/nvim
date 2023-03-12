return {
  {
    "<Leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "toggle breakpoint",
  },
  {
    "<Leader>dB",
    function()
      vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
        require("dap").set_breakpoint(condition)
      end)
    end,
    desc = "toggle conditional breakpoint",
  },
  {
    "<Leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "continue",
  },
  {
    "<Leader>df",
    function()
      require("dap").step_back()
    end,
    desc = "step back (reverse step)",
  },
  {
    "<Leader>dd",
    function()
      require("dap").step_into()
    end,
    desc = "step into (down)",
  },
  {
    "<Leader>du",
    function()
      require("dap").step_out()
    end,
    desc = "step out (up)",
  },
  {
    "<Leader>ds",
    function()
      require("dap").step_over()
    end,
    desc = "step over (step)",
  },
  {
    "<Leader>dr",
    function()
      require("dap").repl.open()
    end,
    desc = "open repl",
  },
  {
    "<Leader>de",
    function()
      require("dapui").eval()
    end,
    desc = "ui eval",
  },
  {
    "<Leader>dv",
    function()
      require("dapui").toggle()
    end,
    desc = "ui toggle",
  },
}
