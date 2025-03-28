local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local lsp_container = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach" },
  provider = function()
    local client_names = {}
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(client_names, client.name)
    end
    client_names = vim.fn.uniq(client_names)
    return string.format(" %s ", table.concat(client_names, " "))
  end,
  hl = {
    fg = utils.get_highlight("@comment.hint").fg,
  },
}

return lsp_container
