local M = {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		{
			"mfussenegger/nvim-dap",
			event = "VeryLazy",
		},
	},
}

function M.config()
	require("dapui").setup({
		expand_lines = true,
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.33 },
					{ id = "breakpoints", size = 0.17 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				size = 0.33,
				position = "right",
			},
			{
				elements = {
					{ id = "repl", size = 0.45 },
					{ id = "console", size = 0.55 },
				},
				size = 0.27,
				position = "bottom",
			},
		},
		floating = {
			max_height = 0.9,
			max_width = 0.5, -- Floats will be treated as percentage of your screen.
			border = "rounded",
			-- border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		},
	})

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
end

return M
