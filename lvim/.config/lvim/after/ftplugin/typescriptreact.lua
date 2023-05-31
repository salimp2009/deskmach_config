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

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	C = {
		name = "Typescriptreact",
		i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
		o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
		u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
		r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
		f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
		g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
	},
}

which_key.register(mappings, opts)
