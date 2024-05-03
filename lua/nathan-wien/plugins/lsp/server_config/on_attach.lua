local M = {}

M.create = function(opts)
  opts = opts or {}
  return function(client, bufnr)
    if opts.pre_attach then
      opts.pre_attach(client, bufnr)
    end

    if not opts.formatting then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end
end

return M
