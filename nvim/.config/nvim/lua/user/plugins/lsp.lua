return {
	{
		"neovim/nvim-lspconfig",
		commit = "a51892484c2002c083a8b0a9dfcefb3a569be36d",
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
		commit = "6d0bf36870d15c0c2284f4b6693a66552a6bf127",
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
		-- version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- ft = { "toml" },
		config = function()
			require("crates").setup({
				src = {
					cmp = {
						enabled = true,
						use_custom_kind = true,
						kind_text = {
							version = "Version",
							feature = "Feature",
						},
						kind_highlight = {
							version = "CmpItemKindVersion",
							feature = "CmpItemKindFeature",
						},
					},
				},
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				lsp = {
					enabled = true,
					name = "crates.nvim",
					on_attach = function(client, bufnr)
						require("user.lsp.attach").on_attach(client, bufnr)
					end,
					actions = true,
					completion = true,
					hover = true,
				},
				popup = {
					border = "rounded",
				},

				-- null_ls = {
				-- 	enabled = true,
				-- 	name = "crates.nvim",
				-- },
				-- popup = {
				-- 	border = "rounded",
				-- },
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufRead", "BufNew" },
		lazy = true,
		config = function()
			require("user.lsp.null-ls")
		end,
	},
	-- {
	--   "stevearc/conform.nvim",
	--   event = { "BufReadPre", "BufNewFile" },
	--   enabled = true,
	--   lazy = true,
	--   config = function()
	--     require("rj.lsp.nvim-conform")
	--   end,
	--   init = function()
	--     -- If you want the formatexpr, here is the place to set it
	--     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	--   end,
	-- },
	-- {
	--   "mfussenegger/nvim-lint",
	--   event = { "BufReadPre", "BufNewFile" },
	--   lazy = true,
	--   enabled = true,
	--   config = function()
	--     require("rj.lsp.nvim-lint")
	--   end,
	-- },

	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "BufRead",
		lazy = true,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		lazy = true,
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	tag = "legacy",
	-- 	config = function()
	-- 		require("fidget").setup()
	-- 	end,
	-- },
}
