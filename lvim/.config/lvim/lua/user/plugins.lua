-- Additional Plugins
lvim.plugins = {
	{ url = "git@github.com:ChristianChiarulli/bookmark.nvim.git" },
	{ url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
	{ url = "git@github.com:LunarVim/primer.nvim.git" },
	{
		"tpope/vim-dadbod",
		-- lazy = "VeryLazy",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		-- lazy = "VeryLazy",
		-- cmd = "DAPUI",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		priority = 20,
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
		},
	},
	{
		"christianchiarulli/harpoon",
		event = "BufRead",
	},
	{
		"kndndrj/nvim-dbee",
		event = "BufRead",
		-- lazy = "VeryLazy",
		build = function()
			require("dbee").install()
		end,
	},
	{
		"kkharji/sqlite.lua",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	},
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
			})
		end,
		event = "BufRead",
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "BufRead",
	},
	{
		"tzachar/cmp-tabnine",
		event = "InsertEnter",
		build = "./install.sh",
	},
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = { "BufRead", "InsertEnter" },
	-- 	config = function()
	-- 		vim.g.codeium_enabled = false
	-- 	end,
	-- },
	{ "p00f/clangd_extensions.nvim" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"monaqa/dial.nvim",
		event = "BufRead",
	},
	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		event = "BufRead",
		lazy = true,
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
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
	},
	{
		"leoluz/nvim-dap-go",
		event = "BufRead",
		lazy = "VeryLazy",
	},
	{
		"mfussenegger/nvim-dap-python",
		event = "BufRead",
		lazy = "VeryLazy",
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		event = "BufRead",
		lazy = "VeryLazy",
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		event = "BufRead",
		lazy = "VeryLazy",
	},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		-- build = "npm install --legacy-peer-deps && npm run compile",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},

	{
		"simrat39/rust-tools.nvim",
		event = "BufRead",
		lazy = true,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		lazy = VeryLazy,
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
	-- {
	-- 	-- show diagnoscics with arrows
	-- 	url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	-- config = require("user.lsp_lines").config,
	-- 	event = "User FileOpened",
	-- },

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
					names = false,
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

	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = true,
		event = "VeryLazy",
		opts = {
			name = ".venv",
		},
	},
	{ "nvim-neotest/neotest" },
	{ "nvim-neotest/neotest-python" },
}
