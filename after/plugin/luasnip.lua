local luasnip = require("luasnip")

luasnip.config.set_config({
  -- Keep around the last snippet so that we can jump back to it even if
  -- we have moved outside of the selection
  history = true,

  -- Update as we type when using dynamic snippets
  updateevents = "TextChanged,TextChangedI",
})

-- keymaps for insert mode and select mode
-- jump forward
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })
-- jump backward
vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
-- cycle forward through choice node
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })
-- cycle backward through choice node
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(-1)
  end
end, { silent = true })

-- luasnip.snippets = require("nathan-wien.snippets")

-- Snippet creator
-- s(trigger_string, node)
local s = luasnip.snippet

-- Format node
-- fmt(fmt_string, nodes...)
local fmt = require("luasnip.extras.fmt").fmt

-- Insert node
-- This node is used together with format
-- insert(position, [placeholder_text])
--   position: starts from 1
local i = luasnip.insert_node

--- Repeat node
-- This node replicates another node in a (previous) position
local rep = require("luasnip.extras").rep

-- luasnip.add_snippets("all", {
-- })
