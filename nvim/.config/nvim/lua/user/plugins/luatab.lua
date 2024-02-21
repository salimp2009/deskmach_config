local M = {
	"alvarosevilla95/luatab.nvim",
	event = { "TabNew", "TabEnter", "TabNewEntered" },
	lazy = "VeryLazy",
}

function M.config()
	require("luatab").setup({})
end

return M
