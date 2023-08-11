local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/playground",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		{ "windwp/nvim-ts-autotag" },
		{
			"p00f/nvim-ts-rainbow",
		},
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
		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["at"] = "@class.outer",
					["it"] = "@class.inner",
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["ai"] = "@conditional.outer",
					["ii"] = "@conditional.inner",
					["a/"] = "@comment.outer",
					["i/"] = "@comment.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["as"] = "@statement.outer",
					["is"] = "@scopename.inner",
					["aA"] = "@attribute.outer",
					["iA"] = "@attribute.inner",
					["aF"] = "@frame.outer",
					["iF"] = "@frame.inner",
				},
			},
		},
		rainbow = {
			enable = true,
			extended_mode = false,
			disable = { "html" },
		},
	})
end

return M
