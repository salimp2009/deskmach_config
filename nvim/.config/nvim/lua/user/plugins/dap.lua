local M = {
	"mfussenegger/nvim-dap",
	commit = "6b12294a57001d994022df8acbe2ef7327d30587",
	event = "VeryLazy",
}

function M.config()
	local dap = require("dap")

	local dap_ui_status_ok, dapui = pcall(require, "dapui")
	if not dap_ui_status_ok then
		return
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

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
	-- dap.configurations.rust = dap.configurations.cpp
end
return M
