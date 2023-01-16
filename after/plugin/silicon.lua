local silicon = require("silicon")
local palette = require("nathan-wien.plugins.catppuccin").palette

require("silicon").setup({
  bgColor = palette.base, -- can also use "#FCFBFA" for slides at work
  font = "JetbrainsMono Nerd Font",
  -- lineOffset = 40, -- from where to start line number
  windowControls = false,
  lineNumber = false,

  -- theme = "auto",
  -- output = "SILICON_${year}-${month}-${date}_${time}.png",
  -- -- auto generate file name based on time (absolute or relative to cwd)
  -- bgColor = vim.g.terminal_color_5,
  -- bgImage = "", -- path to image, must be png
  -- roundCorner = true,
  -- windowControls = true,
  -- lineNumber = true,
  -- font = "monospace",
  -- linePad = 2, -- padding between lines
  -- padHoriz = 80, -- Horizontal padding
  -- padVert = 100, -- vertical padding
  -- shadowBlurRadius = 10,
  -- shadowColor = "#555555",
  -- shadowOffsetX = 8,
  -- shadowOffsetY = 8,
  -- gobble = false, -- enable lsautogobble like feature
  -- debug = false, -- enable debug output
})

-- Generate image of lines in a visual selection
vim.keymap.set("v", ",ss", function()
  silicon.visualise_api({})
end)
-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set("v", ",sb", function()
  silicon.visualise_api({ to_clip = true, show_buf = true })
end)
-- Generate visible portion of a buffer
vim.keymap.set("n", ",sp", function()
  silicon.visualise_api({ to_clip = true, visible = true })
end)
-- Generate current buffer line in normal mode
vim.keymap.set("n", ",sl", function()
  silicon.visualise_api({ to_clip = true })
end)
