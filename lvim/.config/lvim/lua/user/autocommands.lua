vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.tf",
	callback = function()
		vim.cmd([[
      au BufRead,BufNewFile *.tf setlocal filetype=terraform
    ]])
	end,
})
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"sql",
-- 		"mysql",
-- 		"plsql",
-- 	},
-- 	callback = function()
-- 		vim.schedule(db_completion)
-- 	end,
-- })

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

vim.cmd([[
  augroup terminal_setup | au!
  autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
  autocmd TermEnter * startinsert!
  augroup end
]])

vim.api.nvim_create_autocmd({ "TermEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "pdf", "svg", "jpeg", "png" },
	callback = function(ev)
		local filename = ev.file
		vim.fn.jobstart({ "xdg-open", filename }, { detach = true })
		vim.api.nvim_buf_delete(0, {})
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
