local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
	vim.g.indent_blankline_filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
	}
	vim.g.indentLine_enabled = 1
	vim.g.indent_blankline_char = "▏"
	vim.g.indent_blankline_show_trailing_blankline_indent = false
	vim.g.indent_blankline_show_first_indent_level = true
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_show_current_context = true
	-- vim.g.indent_blankline_context_patterns = {
	-- 	"class",
	-- 	"return",
	-- 	"function",
	-- 	"method",
	-- 	"^if",
	-- 	"^while",
	-- 	"jsx_element",
	-- 	"^for",
	-- 	"^object",
	-- 	"^table",
	-- 	"block",
	-- 	"arguments",
	-- 	"if_statement",
	-- 	"else_clause",
	-- 	"jsx_element",
	-- 	"jsx_self_closing_element",
	-- 	"try_statement",
	-- 	"catch_clause",
	-- 	"import_statement",
	-- 	"operation_type",
	-- }
	-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
	vim.wo.colorcolumn = "99999"
	vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#737aa2", nocombine = true })
	vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3b4261", nocombine = true })
	-- vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#1d2228" })
	-- vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#1d2228" })

	-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#1d2228 gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#1d2228 gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#1d2228 gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#1d2228 gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#1d2228 gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#1d2228 gui=nocombine]]) --
	-- vim.opt.list = true
	-- vim.opt.listchars:append "space:⋅"
	-- vim.opt.listchars:append "space:"
	-- vim.opt.listchars:append "eol:↴"

	require("indent_blankline").setup({
		-- show_end_of_line = true,
		-- space_char_blankline = " ",
		show_current_context = true,
		context_char = "▏",
		-- show_current_context_start = true,
		-- char_highlight_list = {
		-- 	"IndentBlanklineIndent1",
		-- 	"IndentBlanklineIndent2",
		-- 	"IndentBlanklineIndent3",
		-- },
	})
end

return M
