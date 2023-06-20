vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not directory then
			return
		end

		-- change to the directory
		vim.cmd.cd(data.file)

		-- open the tree
		-- require("nvim-tree.api").tree.focus()
		require("nvim-tree.api").tree.open()
	end,
})

    vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		local line_count = vim.api.nvim_buf_line_count(0)
		if line_count >= 10000 then
			vim.cmd("IlluminatePauseBuf")
		end
	end,
})

vim.api.nvim_create_autocmd({ "TermEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "" },
	callback = function()
		local get_project_dir = function()
			local cwd = vim.fn.getcwd()
			local project_dir = vim.split(cwd, "/")
			local project_name = project_dir[#project_dir]
			return project_name
		end
		vim.opt.titlestring = get_project_dir()
	end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true })
-- 	end,
-- })
-- vim.cmd([[
--   augroup terminal_setup | au!
--   autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
--   autocmd TermEnter * startinsert!
--   augroup end
-- ]])
--
-- vim.api.nvim_create_autocmd({ "TermEnter" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.cmd("startinsert")
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	callback = function()
-- 		require("user.lsp.attach").enable_format_on_save()
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({"VimEnter"},
--   {
--     callback = function()
--       vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
--       vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
--       vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
--       vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
--     end,
--   })
