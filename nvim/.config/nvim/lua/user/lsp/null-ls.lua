local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,

	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = {},
			filetypes = {
				"jsonc",
				"toml",
				"astro",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"toml",
			},
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.autopep8,
		formatting.stylua,
		-- formatting.beautysh,
		formatting.astyle.with({
			extra_args = { "--indent=spaces=4", "style=google" },
		}),
		formatting.rustfmt,
		formatting.clang_format,
		diagnostics.shellcheck,
		-- diagnostics.shellcheck.with({ filetypes = { "sh", "bash", "zsh" } }),
		diagnostics.zsh,
		diagnostics.proselint,
		diagnostics.flake8,
	},
})
