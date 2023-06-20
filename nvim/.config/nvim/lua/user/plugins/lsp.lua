return {
	{
		"neovim/nvim-lspconfig",
		ft = {
			"markdown",
			"lua",
			"c",
			"cpp",
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
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufRead", "BufNew" },
		lazy = true,
		config = function()
			require("user.lsp.null-ls")
		end,
	},
}
