local M = {
	"folke/tokyonight.nvim",
	-- commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	-- enabled = false,
}

M.name = "tokyonight-night"
function M.config()
	require("tokyonight").setup({
		-- use the night style
		style = "night",
		-- disable italic for functions
		-- keywords = { italic = false },
		styles = {
			functions = {},
		},
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
		-- Change the "hint" color to the "orange" color, and make the "error" color bright red
		on_colors = function(colors)
			colors.hint = colors.orange
			colors.error = "#ff0000"
		end,
	})

	local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
	if not status_ok then
		return
	end
end

return M
