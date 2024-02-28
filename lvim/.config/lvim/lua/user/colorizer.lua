require("colorizer").setup({
	filetypes = {
		"astro",
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
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		rgb_fn = true,
		css = true,
		css_fn = true,
		hsl_fn = true, -- CSS hsl() and hsla() functions
		mode = "background",
		virtualtext = "■",
		tailwind = "both",
		sass = { enable = true, parsers = { "css" } },
	},
	buftypes = {},
})
