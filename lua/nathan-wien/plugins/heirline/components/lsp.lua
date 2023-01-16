local palette = require("nathan-wien.plugins.catppuccin").palette
local conditions = require("heirline.conditions")

local lsp_container = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach" },
  provider = function()
    local client_names = {}
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      if client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
    end
    vim.list_extend(
      client_names,
      require("nathan-wien.lsp.data.null-ls").active_sources(vim.bo.filetype)
    )
    client_names = vim.fn.uniq(client_names)
    return string.format(" %s ", table.concat(client_names, " "))
  end,
  hl = {
    fg = "#FFFFFF",
    bg = palette.lavender,
  },
}

return lsp_container
