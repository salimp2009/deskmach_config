require("lvim.lsp.manager").setup("sqlls", {
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	filetypes = { "sql", "mysql" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})
