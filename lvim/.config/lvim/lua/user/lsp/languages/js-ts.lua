-- Debugger setup
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "lvim/mason/")
require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	debugger_path = "/home/salim/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug/", -- Path to vscode-js-debug installation.
	-- debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		-- Jest debugging
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Debug Jest Tests",
		-- 	-- trace = true, -- include debugger info
		-- 	runtimeExecutable = "node",
		-- 	runtimeArgs = {
		-- 		"./node_modules/jest/bin/jest.js",
		-- 		"--runInBand",
		-- 	},
		-- 	rootPath = "${workspaceFolder}",
		-- 	cwd = "${workspaceFolder}",
		-- 	console = "integratedTerminal",
		-- 	internalConsoleOptions = "neverOpen",
		-- },
	}
end

-- local code_actions = require("lvim.lsp.null-ls.code_actions")
-- code_actions.setup({
-- 	-- { name = "proselint" },
-- 	{ name = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescriptreact", "typescript" } },
-- })

-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
-- 	{ command = "eslint_d", filetypes = { "javascript", "typescript" } },
-- })
