vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "marksman" })

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("marksman", {
	filetypes = { "markdown", "md", "mdx", "markdown.mdx" },
})

-- require("lvim.lsp.manager").setup("marksman")
vim.opt_local.wrap = true
vim.opt_local.spell = true
