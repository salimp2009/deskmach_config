vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

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

local opts = {
	cmd = { provider, unpack(clangd_flags) },
	on_attach = custom_on_attach,
	on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- local dap = require('dap')
lvim.builtin.dap.on_config_done = function(dap)
	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
		name = "lldb",
	}

	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			env = function()
				local variables = {}
				for k, v in pairs(vim.fn.environ()) do
					table.insert(variables, string.format("%s=%s", k, v))
				end
				return variables
			end,

			-- 💀
			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			-- runInTerminal = false,
		},
	}

	-- If you want to use this for Rust and C, add something like this:

	dap.configurations.c = dap.configurations.cpp
end
