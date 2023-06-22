-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{
		-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		-- extra_args = { "--print-with", "100" },
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = {
			"astro",
			"html",
			"css",
			"markdown",
			"typescript",
			"typescriptreact",
			"javascriptreact",
			"javascript",
		},
	},
	{ command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
	{ command = "stylua", filetypes = { "lua" } },
	{ name = "taplo", filetypes = { "toml" } },
	-- { command = "rustfmt", filetypes = { "rust", "*.rs" } },
	{ command = "clang-format", filetypes = { "cpp", "c" } },
})
vim.filetype.add({
	extension = {
		zsh = "zsh",
	},
})

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{ name = "jsonlint" },
	{
		command = "markdownlint",
		extra_args = { "--line-length=false", "--no-inline-html=false" },
	},
	{
		-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "shellcheck",
		filetypes = { "sh", "bash", "zsh" },
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--severity", "warning" },
	},
	-- {
	-- 	command = "codespell",
	-- 	---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	-- 	filetypes = { "javascript", "python", "markdown", "cpp" },
	-- },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	-- { name = "proselint" },
	{ name = "cspell", filetypes = { "markdown" } },
})
