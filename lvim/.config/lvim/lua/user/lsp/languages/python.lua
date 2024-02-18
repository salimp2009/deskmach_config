-- Setup dap for python
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
	-- require("dap-python").setup("python")
end)

-- local python_path = mason_path .. "packages/debugpy/venv/bin/python"

pcall(function()
	require("dap-python").test_runner = "pytest"
end)

require("neotest").setup({
	adapters = {
		require("neotest-python")({
			-- Extra arguments for nvim-dap configuration
			-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
			dap = {
				justMyCode = false,
				-- console = "integratedTerminal",
			},
			args = {
				"--log-level",
				"DEBUG",
				"--quiet",
				-- "--fixtures",
			},
			-- runner = "pytest",
			-- python = ".venv/bin/python",
			-- python = python_path,
		}),
	},
})
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "python" },
-- 	callback = function()
-- 		lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
-- 		lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
-- 		lvim.builtin.which_key.vmappings["d"] = {
-- 			name = "Debug",
-- 			S = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
-- 		}
-- 	end,
-- })
