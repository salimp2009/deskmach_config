vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"Jaq",
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		local buf_ft = vim.bo.filetype
		if buf_ft == "" or buf_ft == nil then
			vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <c-j> j<CR>
      " nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]])
		end
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
