local M = {}

local glyphs = {
  inactive = "鈴",
  loading = "",
}

local components = {
  lsp = {
    function(msg)
      msg = msg or glyphs.inactive
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return glyphs.inactive
        end
        return msg
      end

      local buf_client_names = {}
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      vim.list_extend(
        buf_client_names,
        require("nathan-wien.lsp.data.null-ls").active_sources(vim.bo.filetype)
      )

      local unique_client_names = vim.fn.uniq(buf_client_names)
      if vim.tbl_count(unique_client_names) > 0 then
        return table.concat(unique_client_names, "|")
      else
        return glyphs.loading
      end
    end,
    color = { gui = "bold" },
    cond = function()
      return vim.fn.winwidth(0) > 70
    end,
  },
}

M.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch" },
  lualine_c = { "diff", "diagnostics" },
  lualine_x = { "filetype" },
  lualine_y = { components.lsp },
  lualine_z = { "location" },
}

return M
