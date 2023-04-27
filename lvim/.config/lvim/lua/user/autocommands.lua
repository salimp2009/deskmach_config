vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- vim.cmd([[
--   augroup MyHighlightOverrides
--     autocmd!
--     autocmd ColorScheme * highlight link @css_class Boolean
--     autocmd ColorScheme * highlight @css_id guifg=#b6fa37 guibg=none
--     autocmd ColorScheme * highlight @css_tag guifg=#100afc guibg=none
--   augroup END
-- ]])
