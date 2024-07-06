local custom_theme_name = vim.env.GLOBAL_THEME

return {
  "navarasu/onedark.nvim",
  name = "onedark",
  cond = custom_theme_name == "onedark",
  config = function()
    -- require("onedark").setup({
    --   style = "darker",
    -- })
    require("onedark").load()
    local vimodes = { "Insert", "Normal", "Visual", "Command", "Replace", "Other" }
    for _, mode in ipairs(vimodes) do
      vim.api.nvim_set_hl(
        0,
        "HeirlineViMode" .. mode,
        { link = "MiniStatuslineMode" .. mode }
      )
    end

    vim.api.nvim_set_hl(0, "HeirlineFilenameActive", { link = "MiniTablineCurrent" })
    vim.api.nvim_set_hl(0, "HeirlineFilenameInactive", { link = "MiniTablineVisible" })
    vim.api.nvim_set_hl(0, "WinBar", { link = "StatusLine" })
    vim.api.nvim_set_hl(0, "WinBarNC", { link = "StatusLineNC" })
  end,
}
