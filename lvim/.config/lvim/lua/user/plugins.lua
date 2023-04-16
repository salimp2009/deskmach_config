-- Additional Plugins
lvim.plugins = {
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh",
	},
	{
		"Exafunction/codeium.vim",
		config = function()
			vim.g.codeium_enabled = false
		end,
	},
	{ "p00f/clangd_extensions.nvim" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "monaqa/dial.nvim" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "roobert/tailwindcss-colorizer-cmp.nvim" },
	{ "lunarvim/darkplus.nvim" },
	{
		"p00f/nvim-ts-rainbow",
	},
	{ "lvimuser/lsp-inlayhints.nvim" },
	{ "windwp/nvim-spectre" },
	{ "mfussenegger/nvim-jdtls" },
	{ "leoluz/nvim-dap-go" },
	{ "mfussenegger/nvim-dap-python" },
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "mxsdev/nvim-dap-vscode-js" },
	{
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npm run compile",
	},

	{ "simrat39/rust-tools.nvim" },
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		requires = { "nvim-lua/plenary.nvim" },
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
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("fidget").setup()
	-- 	end,
	-- },

	{ "kylechui/nvim-surround" },

	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_auto_close = 0
		end,
	},

	{ "Bryley/neoai.nvim" },

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"typescript",
					"typescriptreact",
					"javascript",
					"javascriptreact",
					"css",
					"html",
					"astro",
					"lua",
				},
				user_default_options = {
					rgb_fn = true,
					tailwind = "both",
				},
				buftypes = {
					-- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
					-- Not sure if the window has a `buftype` at all
				},
			})
		end,
	},
}
-- adding plugin configuration file under ./lua/user/
