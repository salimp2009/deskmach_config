-- Additional Plugins
lvim.plugins = {
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh",
	},
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
