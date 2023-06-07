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

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

require("typescript").setup({
	-- disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = require("lvim.lsp").common_on_attach,
		on_init = require("lvim.lsp").common_on_init,
		capabilities = capabilities,
		settings = {
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = false,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
})

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
		name = "Javascriptreact",
		i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
		o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
		u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
		r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
		f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
		g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
	},
}

which_key.register(mappings, opts)
