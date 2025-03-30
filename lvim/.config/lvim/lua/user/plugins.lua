-- Additional Plugins

lvim.plugins = {
	-- { "mattn/webapi-vim" },
	-- { "mattn/vim-gist" },
	-- { "Shatur/neovim-tasks" },
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	-- opts = { italics = true },
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			italics = true,
	-- 		})
	-- 	end,
	-- },
	{
		"kevinhwang91/nvim-ufo",
		lazy = true,
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	-- {
	-- 	"cdelledonne/vim-cmake",
	-- 	ft = { "cpp", "c", "cmake", "fortran" },
	-- 	-- lazy = true,
	-- },
	-- {
	-- 	"krady21/compiler-explorer.nvim",
	--    enabled=false,
	-- 	lazy = true,
	-- },
	{
		"linrongbin16/gitlinker.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		event = "VeryLazy",
	},
	-- {
	-- 	"liaozixin/nvim-cpptools",
	-- 	ft = { "cpp", "c" },
	-- 	lazy = true,
	-- },
	{
		"Rawnly/gist.nvim",
		cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
		config = true,
		lazy = true,
	},
	{
		"samjwill/nvim-unception",
		lazy = false,
		init = function()
			vim.g.unception_block_while_host_edits = true
		end,
	},
	{
		url = "git@github.com:ChristianChiarulli/bookmark.nvim.git",
		lazy = true,
	},
	{
		url = "git@github.com:ChristianChiarulli/onedark.nvim.git",
		-- lazy = true,
	},
	{ url = "git@github.com:LunarVim/primer.nvim.git" },
	{ "towolf/vim-helm" },
	{
		"tpope/vim-dadbod",
		dependencies = {
			-- { "kristijanhusak/vim-dadbod-completion" },
			{
				"kristijanhusak/vim-dadbod-ui",
				-- config = function()
				-- 	local status_ok, cmp = pcall(require, "nvim-cmp")
				-- 	if status_ok then
				-- 		vim.api.nvim_create_autocmd("FileType", {
				-- 			pattern = { "sql", "mysql", "plsql" },
				-- 			callback = function()
				-- 				cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
				-- 			end,
				-- 		})
				-- 	end
				-- end,
			},
		},
		cmd = { "DBUI", "DBUIToggle" },
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
		lazy = true,
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
	{
		"p00f/clangd_extensions.nvim",
		ft = { "cpp", "c", "cmake" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
	},
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
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		lazy = true,
	},
	{ "lunarvim/darkplus.nvim" },
	-- {
	-- 	"p00f/nvim-ts-rainbow",
	-- },
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		-- event = "LspAttach",
		-- branch = "anticonceal",
		-- lazy = true,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		lazy = "VeryLazy",
	},
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = { "java" },
	},
	{
		"leoluz/nvim-dap-go",
		event = "BufRead",
		ft = { "go" },
		lazy = "VeryLazy",
	},
	{
		"mfussenegger/nvim-dap-python",
		event = "BufRead",
		ft = { "python" },
		lazy = "VeryLazy",
	},
	-- {
	-- 	"jose-elias-alvarez/typescript.nvim",
	-- 	event = "BufRead",
	-- 	lazy = "VeryLazy",
	-- },
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
		ft = { "rust", "Cargo.toml" },
		lazy = true,
	},
	{
		"folke/todo-comments.nvim",
		-- enabled = false,
		dependencies = { "folke/trouble.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		-- lazy = "VeryLazy",
		config = require("user.todo_comments"),
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		-- enabled = false,
	},
	{
		"saecki/crates.nvim",
		-- version = "v0.3.0",
		-- ft = { "toml" },
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
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
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown", "markdown.mdx", "mdx" },
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
		event = "BufReadPre",
		lazy = true,
		config = function()
			require("user.colorizer")
			-- require("colorizer").setup({
			-- 	filetypes = {
			-- 		"astro",
			-- 		"typescript",
			-- 		"typescriptreact",
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"css",
			-- 		"html",
			-- 		"astro",
			-- 		"lua",
			-- 	},
			-- 	user_default_options = {
			-- 		names = false,
			-- 		RGB = true, -- #RGB hex codes
			-- 		RRGGBB = true, -- #RRGGBB hex codes
			-- 		rgb_fn = true,
			-- 		css = true,
			-- 		css_fn = true,
			-- 		hsl_fn = true, -- CSS hsl() and hsla() functions
			-- 		mode = "background",
			-- 		virtualtext = "■",
			-- 		tailwind = "both",
			-- 	},
			-- 	buftypes = {},
			-- })
		end,
	},

	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = true,
		event = "VeryLazy",
		ft = { "python" },
		opts = {
			name = ".venv",
		},
	},
	{ "nvim-neotest/neotest" },
	{
		"nvim-neotest/neotest-python",
		ft = { "python" },
		lazy = true,
	},
}
