vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("bashls", {
	filetypes = { "sh", "zsh", ".envrc" },
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})
