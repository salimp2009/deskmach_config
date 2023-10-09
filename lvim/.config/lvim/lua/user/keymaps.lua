local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("x", "p", [["_dP]])
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- h, l does not go line below if they are at beginning or end of line
-- vim.cmd("set ww-=h,l")

-- keymap("n", "<c-j>", "<c-d>", opts)
-- keymap("n", "<c-k>", "<c-u>", opts)

-- This causes a bug; Enter key in normal mode jumo lines
-- keymap("n", "<c-m>", "<s-m>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
-- keymap("n", "<m-j>", "<C-w>j", opts)
-- keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

lvim.keys.term_mode = { ["<C-l>"] = false }

function _G.set_terminal_keymaps()
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

keymap("n", "<PageDown>", "<cmd>BookmarkNext<cr>", opts)
keymap("n", "<PageUp>", "<cmd>BookmarkPrev<cr>", opts)
keymap("n", "<m-c>", "<cmd>BookmarkToggle<cr>", opts)
keymap("n", "<m-x>", "<cmd>BookmarkClear<cr>", opts)
keymap("n", "<s-tab>", "<cmd>FilemarkToggle<cr>", opts)
keymap("n", "<s-l>", "<cmd>FilemarkNext<cr>", opts)
keymap("n", "<s-h>", "<cmd>FilemarkPrev<cr>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	"<cmd>lua require('telescope').extensions.bookmark.filemarks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Filemarks'})<cr>",
	opts
)
lvim.keys.normal_mode["<C-space>"] = ":Telescope buffers sort_mru=true only_cwd=true initial_mode=insert<CR>"
-- -- vim.cmd([[

--   function! QuickFixToggle()
--     if empty(filter(getwininfo(), 'v:val.quickfix'))
--       copen
--     else
--       cclose
--     endif
--   endfunction
-- ]])

-- keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)
