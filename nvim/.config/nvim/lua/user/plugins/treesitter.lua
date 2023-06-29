local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/playground",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		{ "windwp/nvim-ts-autotag" },
		{
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({
					override = {
						zsh = {
							icon = "",
							color = "#428850",
							cterm_color = "65",
							name = "Zsh",
						},
					},
					color_icons = true,
					default = true,
				})
			end,
		},
	},
}

function M.config()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"c",
			"cpp",
			"rust",
			"astro",
			"toml",
			"vim",
			"vimdoc",
			"html",
			"python",
			"gitignore",
			"javascript",
			"json",
			"jsonc",
			"make",
			"typescript",
			"tsx",
			"vim",
			"yaml",
		}, -- put the language you want in this array
		-- ensure_installed = "all",
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		ignore_install = {}, -- List of parsers to ignore installing
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
			-- additional_vim_regex_highlighting = true,
		},
		indent = { enable = true, disable = { "python" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
