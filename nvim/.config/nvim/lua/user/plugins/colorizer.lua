local M = {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	lazy = true,
}

function M.config()
	require("colorizer").setup({
		filetypes = { "*" },
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue or blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			AARRGGBB = false, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB,
			-- RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "background", -- Set the display mode.
			virtualtext = "■",
			tailwind = "both",
		},
		-- all the sub-options of filetypes apply to buftypes
		buftypes = {},
	})
end

return M
