-- platform: win, linux, mac
local platform
if vim.loop.os_uname().sysname == "Darwin" then
  platform = "mac"
else
  platform = "linux"
end

local mason_jdtls_dir = require("mason.settings").current.install_root_dir
  .. "/packages/jdtls"
local jdtls_dir = vim.fn.stdpath("data") .. "/jdtls"

local equinox_jar_path =
  vim.fn.glob(mason_jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_**.jar")
local platform_config_path = mason_jdtls_dir .. "/config_" .. platform

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = jdtls_dir .. "/workspaces/" .. project_name

-- jar files for debugging
-- from java-debug
local bundles = {
  vim.fn.glob(
    jdtls_dir
      .. "/plugins/java-debug"
      .. "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
  ),
}
-- from vscode-java-text
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(jdtls_dir .. "/plugins/vscode-java-test" .. "/server/*.jar"),
    "\n"
  )
)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- 'java' or '/path/to/java17_or_newer/bin/java',
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    "/usr/lib/jvm/java-17-openjdk-amd64/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    equinox_jar_path,
    "-configuration",
    platform_config_path,
    "-data",
    workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- For a list of options, see
  -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {},
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
  },

  on_attach = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
    -- Disable formatting
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    -- Apply default config
    require("nathan-wien.lsp.default.on_attach")(client, bufnr)
  end,
}

return config
