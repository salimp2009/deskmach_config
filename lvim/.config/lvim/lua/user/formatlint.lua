-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "ruff", filetypes = { "python" } },
	-- { command = "isort", filetypes = { "python" } },
	{ command = "goimports", filetypes = { "go" } },
	{ command = "gofumpt", filetypes = { "go" } },
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
			"vue",
			"svelte",
		},
	},
	{ command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
	{ command = "stylua", filetypes = { "lua" } },
	{ name = "taplo", filetypes = { "toml" } },
	-- { command = "rustfmt", filetypes = { "rust", "*.rs", "rs" }, extra_args = { "--edition=2021" } },
	{ command = "clang-format", filetypes = { "c", "cpp", "cs", "java", "cuda", "proto" } },
	{ command = "cmake-format", filetypes = { "cmake" } },
})

vim.filetype.add({
	extension = {
		zsh = "zsh",
	},
})

vim.filetype.add({
	extension = {
		mdx = "markdown",
	},
})

-- vim.filetype.add({
-- 	filename = {
-- 		["terraform"] = "*.tf",
-- 	},
-- })

vim.cmd([[
au BufRead,BufNewFile *.tf setlocal filetype=terraform
]])

vim.filetype.add({
	filename = {
		[".envrc"] = "sh",
	},
})

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

vim.filetype.add({
	extension = {
		ansible = "yaml.ansible",
	},
})

vim.filetype.add({
	extension = {
		yml = "*.yaml",
	},
})

vim.filetype.add({
	extension = {
		gotmpl = "helm",
	},
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",
		["helmfile.*%.yaml"] = "helm",
	},
})

vim.filetype.add({
	pattern = {
		[".*%.symlink"] = function(path, bufno, ext)
			return vim.filetype.match({ buf = bufno, filename = path:gsub(".symlink", "") })
		end,
	},
})

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ansiblels"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "neocmake"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "tflint"
end, lvim.lsp.automatic_configuration.skipped_servers)

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cmake" })

-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- 	return server ~= "denols"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "vuels"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- 	return server ~= "sqls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { command = "flake8", filetypes = { "python" } },
	{ command = "ruff", filetypes = { "python" } },

	{ name = "jsonlint" },
	{
		name = "eslint_d",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
		-- extra_args = { "--config", "--no-eslintrc" },
	},

	{
		command = "markdownlint",
		extra_args = { "--line-length=false", "--no-inline-html=false" },
	},
	{
		command = "ansiblelint",
		filetypes = { "yaml.ansible" },
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
	{
		command = "cppcheck",
		filetypes = { "cpp", "c" },
	},
	-- {
	-- 	command = "cmake_lint",
	-- 	filetypes = { "cmake" },
	-- },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		name = "eslint_d",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
	},
})

-- Sample filetype config for ansible; Check if it works
-- local function yaml_ft(path, bufnr)
-- 	-- get content of buffer as string
-- 	local content = vim.filetype.getlines(bufnr)
-- 	if type(content) == "table" then
-- 		content = table.concat(content, "\n")
-- 	end

-- 	-- check if file is in roles, tasks, or handlers folder
-- 	local path_regex = vim.regex("(tasks\\|roles\\|handlers)/")
-- 	if path_regex and path_regex:match_str(path) then
-- 		return "yaml.ansible"
-- 	end
-- 	-- check for known ansible playbook text and if found, return yaml.ansible
-- 	local regex = vim.regex("hosts:\\|tasks:")
-- 	if regex and regex:match_str(content) then
-- 		return "yaml.ansible"
-- 	end

-- 	-- return yaml if nothing else
-- 	return "yaml"
-- end

-- vim.filetype.add({
-- 	extension = {
-- 		yml = yaml_ft,
-- 		yaml = yaml_ft,
-- 	},
-- })
