local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- Advanced pyright configuration
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })

local pyright_opts = {
	single_file_support = true,
	settings = {
		pyright = {
			disableLanguageServices = false,
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace", -- openFilesOnly, workspace
				typeCheckingMode = "basic", -- off, basic, strict
				useLibraryCodeForTypes = true,
			},
			inlayHints = {
				variableTypes = true,
				functionReturnTypes = true,
			},
		},
	},
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

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
		name = "Python",
		t = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" },
		T = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
		s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
		v = { "<cmd>VenvSelect<cr>", "Virtual Env Select" },
		V = { "<cmd>VenvSelectCached<cr>", "Virtual Env Select Cached" },
		n = { "<cmd>lua require('neotest').run.run()<cr>", "NeoTest Run Test" },
		N = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "NeoTest Run File" },
		d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "NeoTest Debug" },
		D = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "NeoTest Class DAP" },
	},
}

which_key.register(mappings, opts)
