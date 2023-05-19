-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "marksman" })

-- local lsp_manager = require("lvim.lsp.manager")

-- lsp_manager.setup("marksman", {
-- 	filetypes = { "markdown", "md" },
-- 	on_init = require("lvim.lsp").common_on_init,
-- 	capabilities = require("lvim.lsp").common_capabilities(),
-- })

require("lvim.lsp.manager").setup("marksman")
vim.opt_local.wrap = true
vim.opt_local.spell = true
