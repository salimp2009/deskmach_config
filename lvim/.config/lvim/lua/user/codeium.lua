local ok, codeium = pcall(require, "codeium")
if not ok then
	return
end

-- codeium.config = function()
-- 	vim.keymap.set("i", "<C-a>", function()
-- 		return vim.fn["codeium#Accept"]()
-- 	end, { expr = true })

-- 	vim.keymap.set("i", "<c-j>", function()
-- 		return vim.fn["codeium#CycleCompletions"](1)
-- 	end, { expr = true })

-- 	vim.keymap.set("i", "<c-k>", function()
-- 		return vim.fn["codeium#CycleCompletions"](-1)
-- 	end, { expr = true })

-- 	vim.keymap.set("i", "<c-x>", function()
-- 		return vim.fn["codeium#Clear"]()
-- 	end, { expr = true })
-- end

local sources_table = lvim.builtin.cmp.sources
sources_table[#sources_table + 1] = { name = "codeium" }

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap.set

-- keymap("i", "<c-k>", "<Cmd>call codeium#CycleCompletions(1)<CR>", opts)
-- keymap("i", "<c-j>", "<Cmd>call codeium#CycleCompletions(-1)<CR>", opts)
-- keymap("i", "<c-x>", "<Cmd>call codeium#Clear()<CR>", opts)
-- keymap("i", "<c-a>", "<Cmd>call codeium#Accept()<CR>", opts)

vim.keymap.set("i", "<C-s>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })

vim.keymap.set("i", "<c-k>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

vim.keymap.set("i", "<c-j>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })

vim.keymap.set("i", "<c-q>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })
