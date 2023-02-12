local M = {}

M.active_sources = function(filetype)
  local sources = require("null-ls.sources")
  local available_sources = sources.get_available(filetype)
  local active = {}
  for _, source in ipairs(available_sources) do
    table.insert(active, source.name)
  end
  return active
end

return M
