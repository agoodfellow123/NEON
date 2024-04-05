local M = {}

base.default_colorscheme = "cyberdream"

vim.diagnostic.config({
	virtual_text = false,
	virtual_text = {
		prefix = '●',
-- 		message = "\n",
	},
-- 	virtual_lines = true, -- from the lsp_lines.nvim plugin
})

-- vim.diagnostic.message = "\n"

--- Neovide ui commands
if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font:h16"
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_window_blurred = true

	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
end

return M

