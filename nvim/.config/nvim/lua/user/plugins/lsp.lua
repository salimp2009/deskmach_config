return {
	{
		"neovim/nvim-lspconfig",
		ft = {
			"markdown",
			"lua",
			"c",
			"cpp",
			"cmake",
			"java",
			"python",
			"json",
			"xml",
			"bash",
			"sh",
			"toml",
			"zsh",
			"rust",
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"astro",
			"python",
		},
		lazy = true,
		config = function()
			require("user.lsp.attach")
			require("user.lsp.lsp-conf")
			require("user.lsp.diagnostic")
		end,
		dependencies = {
			"folke/neodev.nvim",
		},
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					types = true,
					plugins = {},
				},
				setup_jsonls = true,
				lspconfig = true,
				pathStrict = true,
				override = function(root_dir, settings)
					settings.enabled = true
				end,
			})
		end,
		lazy = true,
		ft = { "lua" },
		opts = {},
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp" },
		lazy = true,
		config = function()
			require("user.lsp.clangd")
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		lazy = true,
		config = function()
			require("user.lsp.rust-tools")
		end,
	},
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- ft = { "toml" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				popup = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufRead", "BufNew" },
		lazy = true,
		config = function()
			require("user.lsp.null-ls")
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "BufRead",
	},
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	tag = "legacy",
	-- 	config = function()
	-- 		require("fidget").setup()
	-- 	end,
	-- },
}
