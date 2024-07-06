return {
  "L3MON4D3/LuaSnip",
  version = "v2.3.0",
  config = function()
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

    require("nathan-wien.plugins.luasnip.snippets")
  end,
}
