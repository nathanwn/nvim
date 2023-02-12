return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = require("nathan-wien.plugins.dap.config.dap"),
    keys = require("nathan-wien.plugins.dap.keys.dap"),
  },
  {
    "rcarriga/nvim-dap-ui",
    version = "v2.6.0",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },

  -- Language-specific plugins
  {
    "mfussenegger/nvim-dap-python",
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
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "go",
    config = function()
      require("dap-go").setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
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
