local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

local get_input = function(prompt)
	local ok, result = pcall(vim.fn.input, { prompt = prompt })
	if not ok then
		return nil
	end
	return result
end
surround.setup({
	keymaps = { -- vim-surround style keymaps
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "s",
		normal_cur = "ss",
		normal_line = "S",
		normal_cur_line = "SS",
		visual = "s",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})

vim.cmd([[nmap <leader>' siw']])
