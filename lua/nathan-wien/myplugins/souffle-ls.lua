vim.api.nvim_create_autocmd("FileType", {
  pattern = { "souffle" },
  callback = function()
    -- Use sdkman to manage java versions
    local java_version = "11.0.19-tem"
    local java = vim.fs.joinpath(
      vim.env.HOME,
      ".sdkman",
      "candidates",
      "java",
      java_version,
      "bin",
      "java"
    )
    local repo_path =
      vim.fs.joinpath(vim.env.HOME, "dev", "personal", "souffle-lsp-plugin")
    local cmd = {
      java,
      "-cp",
      vim.fs.joinpath(repo_path, "build", "libs", "*"),
      "SouffleLanguageServerLauncher",
    }
    vim.lsp.start({
      name = "souffle-ls",
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "main.dl" }, { upward = true })[1]),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = { "*.dl" },
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local on_attach =
      require("nathan-wien.plugins.lsp.server_config.on_attach").create()
    on_attach(client, bufnr)
  end,
})
