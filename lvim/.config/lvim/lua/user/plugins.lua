-- Additional Plugins
lvim.plugins = {
	{
		"tzachar/cmp-tabnine",
		event = "InsertEnter",
		build = "./install.sh",
	},
	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		config = function()
			vim.g.codeium_enabled = false
		end,
	},
	{ "p00f/clangd_extensions.nvim" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"monaqa/dial.nvim",
		event = "BufRead",
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
	{ "lvimuser/lsp-inlayhints.nvim" },
	{
		"windwp/nvim-spectre",
		event = "BufRead",
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "leoluz/nvim-dap-go" },
	{ "mfussenegger/nvim-dap-python" },
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "mxsdev/nvim-dap-vscode-js" },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
	},

	{ "simrat39/rust-tools.nvim" },
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
	},
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_close = 0
		end,
	},

	{ "Bryley/neoai.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{
		"0x100101/lab.nvim",
		build = "cd js && npm ci",
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
