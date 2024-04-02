-- Disable statusline
-- vim.opt.laststatus = 0

-- Disable tabline
-- vim.opt.showtabline = 0

-- Relative numbers
vim.wo.relativenumber = true

-- Disable foldcolumn
-- vim.wo.foldcolumn = "0"

-- Diagnostics mode
vim.g.diagnostics_mode = 2

require("eagle").setup({})

-- make sure mousemoveevent is enabled
vim.o.mousemoveevent = true

local global_note = require("global-note")
global_note.setup({
  filename = "notes.md",
  directory = "./notes/",
  title = "Project Notes",
})
vim.keymap.set("n", "<leader>n", global_note.toggle_note, {
  desc = "Toggle global note",
})

require("codecompanion").setup({
      adapters = {
        chat = require('codecompanion.adapters').use(
          'ollama',
          { schema = { model = { default = 'dolphin-mistral' } } }
        ),
        inline = require('codecompanion.adapters').use(
          'ollama',
          { schema = { model = { default = 'dolphin-mistral' } } }
        ),
      },
  })

  require('diagflow').setup({
	show_borders = true,
	border_chars = {
      top_left = "┌",
      top_right = "┐",
      bottom_left = "└",
      bottom_right = "┘",
      horizontal = "─",
      vertical = "│"
    },
})

