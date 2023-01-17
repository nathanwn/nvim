local M = {}

M.config = function()
  local harpoon_mark = require("harpoon.mark")
  local harpoon_ui = require("harpoon.ui")

  local nav_file = function(id)
    return function()
      harpoon_ui.nav_file(id)
    end
  end

  vim.keymap.set("n", "<Leader>mm", harpoon_mark.add_file)
  vim.keymap.set("n", "<Leader>mv", harpoon_ui.toggle_quick_menu)
  vim.keymap.set("n", "<Leader>]m", harpoon_ui.nav_next)
  vim.keymap.set("n", "<Leader>[m", harpoon_ui.nav_prev)
  vim.keymap.set("n", "<Leader>ma", nav_file(1))
  vim.keymap.set("n", "<Leader>ms", nav_file(2))
  vim.keymap.set("n", "<Leader>md", nav_file(3))
  vim.keymap.set("n", "<Leader>mf", nav_file(4))
end

return M
