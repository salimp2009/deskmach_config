vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })
require("lvim.lsp.manager").setup("dartls", {
	on_attach = require("lvim.lsp").common_on_attach,
	capabilities = require("lvim.lsp").common_capabilities(),
	on_init = require("lvim.lsp").common_on_init,
})
