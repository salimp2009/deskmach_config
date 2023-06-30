vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
	"--background-index",
	"--fallback-style=Google",
	"--all-scopes-completion",
	"--clang-tidy",
	"--log=error",
	"--suggest-missing-includes",
	"--cross-file-rename",
	"--completion-style=detailed",
	"--pch-storage=memory", -- could also be disk
	"--folding-ranges",
	"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
	"--offset-encoding=utf-16", --temporary fix for null-ls
	-- "--limit-references=1000",
	-- "--limit-resutls=1000",
	-- "--malloc-trim",
	-- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
	-- "--header-insertion=never",
	-- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
	require("lvim.lsp").common_on_attach(client, bufnr)

	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
	vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
	vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
	vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
	vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)
	vim.keymap.set("n", "<leader>lH", "<cmd>ClangdToggleInlayHints<cr>", opts)

	require("clangd_extensions.inlay_hints").setup_autocmd()
	require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
	clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
	require("lvim.lsp").common_on_init(client, bufnr)
	require("clangd_extensions.config").setup({})
	require("clangd_extensions.ast").init()
	vim.cmd([[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]])
end

local clangd_cap = require("lvim.lsp").common_capabilities()
clangd_cap.offsetEncoding = { "utf-16" }

local opts = {
	cmd = { provider, unpack(clangd_flags) },
	on_attach = custom_on_attach,
	on_init = custom_on_init,
	capabilities = clangd_cap,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- local dap = require("dap")
lvim.builtin.dap.on_config_done = function(dap)
	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = mason_path .. "bin/OpenDebugAD7",
	}

	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtEntry = true,
			setupCommands = {
				{
					text = "-enable-pretty-printing",
					description = "enable pretty printing",
					ignoreFailures = false,
				},
			},
		},
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			miDebuggerPath = "/usr/bin/gdb",
			-- miDebuggerPath = "/usr/bin/lldb-vscode",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,

			setupCommands = {
				{
					text = "-enable-pretty-printing",
					description = "enable pretty printing",
					ignoreFailures = false,
				},
			},
		},
	}
	dap.configurations.c = dap.configurations.cpp
end
