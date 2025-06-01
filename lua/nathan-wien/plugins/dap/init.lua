local dap_enabled = true
return {
  {
    "mfussenegger/nvim-dap",
    version = "0.10.0",
    cond = dap_enabled,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "williamboman/mason.nvim",
    },
    config = require("nathan-wien.plugins.dap.config.dap"),
    keys = require("nathan-wien.plugins.dap.keys.dap"),
  },
  {
    "rcarriga/nvim-dap-ui",
    cond = dap_enabled,
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    commit = "881a69e2",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    cond = dap_enabled,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    cond = dap_enabled,
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },

  -- Language-specific plugins
  {
    "mfussenegger/nvim-dap-python",
    cond = false,
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "python",
    config = function()
      local dap_python = require("dap-python")
      local dap_python_exec = string.format(
        "%s/packages/debugpy/venv/bin/python",
        require("mason.settings").current.install_root_dir
      )
      dap_python.test_runner = "pytest"
      dap_python.setup(dap_python_exec)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = vim.schedule_wrap(function()
          vim.keymap.set("n", "<Leader>dt", function()
            require("dap-python").test_method()
          end, { desc = "debug test", buffer = 0 })
        end),
        group = vim.api.nvim_create_augroup("dap-python", { clear = true }),
      })
    end,
  },
  {
    "leoluz/nvim-dap-go",
    cond = false,
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "go",
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Remote (port 2345)",
            mode = "remote",
            request = "attach",
          },
        },
        delve = {
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          -- port = "${port}"
          port = "2345",
        },
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = vim.schedule_wrap(function()
          vim.keymap.set("n", "<Leader>dt", function()
            require("dap-go").debug_test()
          end, { desc = "debug test", buffer = 0 })
        end),
        group = vim.api.nvim_create_augroup("dap-go", { clear = true }),
      })
    end,
  },
}
