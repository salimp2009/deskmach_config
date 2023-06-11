vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })
-- shell script setup

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("emmet_ls", {
	-- filetypes = { "astro", "html", "javascriptreact", "typescriptreact", "css", "sass", "scss", "less" },
	filetypes = {
		"astro",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"sass",
		"scss",
		"less",
	},
	-- cmd = { "/Users/chris/Library/Caches/fnm_multishells/65657_1672759387689/bin/ls_emmet", "--stdio" },
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "astro" })
-- local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

-- local lsp_manager = require("lvim.lsp.manager")

-- lsp_manager.setup("astro", {
-- 	init_options = {
-- 		typescript = {
-- 			tsdk = vim.fs.normalize(mason_path .. "packages/typescript-language-server/node_modules/typescript/lib/"),
-- 		},
-- 	},
-- })
