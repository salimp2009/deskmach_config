local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

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
		name = "Rust",
		r = { "<cmd>RustRunnables<Cr>", "Runnables" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
		c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
		p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
		d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
		v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
		R = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
			"Reload Workspace",
		},
		o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
		y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
		P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
		i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
		f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
		D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
	},
	-- R = {
	-- 	name = "Rust Neotest-Debug",
	-- 	n = { "<cmd>lua require('neotest').run.run()<cr>", "NeoTest Method Test" },
	-- 	N = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "NeoTest Class Test" },
	-- 	d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "NeoTest Method DAP" },
	-- 	D = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "NeoTest Class DAP" },
	-- },
}

which_key.register(mappings, opts)
