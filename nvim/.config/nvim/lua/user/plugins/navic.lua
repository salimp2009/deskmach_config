local M = {
	"SmiteshP/nvim-navic",
}

function M.config()
	local icons = require("user.icons")

	require("nvim-navic").setup({
		icons = {
			--   File = ' ',
			--   Module = ' ',
			--   Namespace = ' ',
			--   Package = ' ',
			--   Class = ' ',
			--   Method = ' ',
			--   Property = ' ',
			--   Field = ' ',
			--   Constructor = ' ',
			--   Enum = ' ',
			--   Interface = ' ',
			--   Function = ' ',
			--   Variable = ' ',
			--   Constant = ' ',
			--   String = ' ',
			--   Number = ' ',
			--   Boolean = ' ',
			--   Array = ' ',
			--   Object = ' ',
			--   Key = " ",
			--   Null = ' ',
			--   EnumMember = ' ',
			--   Struct = ' ',
			--   Event = ' ',
			--   Operator = ' ',
			--   TypeParameter = ' '

			Text = "󰉿 ",
			Method = "󰆧 ",
			Function = "󰆧 ",
			Constructor = "󰆧 ",
			Field = " ",
			Variable = " ",
			Class = "󰌗 ",
			Interface = " ",
			Module = "󰅩 ",
			Property = " ",
			Unit = " ",
			Value = "󰎠 ",
			Enum = " ",
			Keyword = "󰉨 ",
			Snippet = "󰃐 ",
			Color = "󰏘 ",
			File = "󰈙 ",
			Reference = " ",
			Folder = "󰉋 ",
			EnumMember = " ",
			Constant = "󰇽 ",
			Struct = " ",
			Event = " ",
			Operator = "󰆕 ",
			TypeParameter = "󰊄 ",
			Array = "󰅨 ",
			Number = " ",
			String = "󰉿 ",
			Boolean = "󰔡",
			Object = "󰅩 ",
			Package = " ",
			Namespace = "󰅩",
			Key = "󰉿",
			Null = "󰟢",
		},

		highlight = true,
		separator = " " .. icons.ui.ChevronRight .. " ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end

return M

