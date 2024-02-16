-- Shorten function name
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Comment Toggle; Normal & visualmode
--keymap("n", "gc", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
--keymap("x", "gc", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Better window navigation
keymap("n", "<c-h>", "<C-w>h", opts)
keymap("n", "<c-j>", "<C-w>j", opts)
keymap("n", "<c-k>", "<C-w>k", opts)
keymap("n", "<c-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- vim.keymap.del("t", "<C-l>")
-- vim.keymap.del({ "n", "i", "v" }, "<C-l>", { buffer = 0 })
-- vim.api.nvim_del_keymap("t", "<C-l>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("i", "<C-a>", "<ESC>:0,$y<CR>a", opts)
keymap("n", "<C-a>", ":0,$y<CR>", opts)

-- keymap("n", ";", ":", opts)

-- open link in Browser
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Normal Mode --
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
-- keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", opts)

function _G.set_terminal_keymaps()
	vim.api.nvim_buf_set_keymap(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

--keymaps for toggleterm
keymap("n", "<M-1>", "<cmd>lua _HORIZ_TOGGLE()<cr>", opts)
keymap("t", "<M-1>", "<cmd>lua _HORIZ_TOGGLE()<cr>", opts)
-- keymap("n", "<M-1>", "<cmd>ToggleTerm direction=horizontal size=12<cr>", opts)
-- keymap("t", "<M-1>", "<cmd>ToggleTerm direction=horizontal size=12<cr>", opts)

keymap("n", "<M-2>", "<cmd>lua _VERT_TOGGLE()<cr>", opts)
keymap("t", "<M-2>", "<cmd>lua _VERT_TOGGLE()<cr>", opts)
-- keymap("n", "<M-2>", "<cmd>ToggleTerm direction=vertical size=50<cr>", opts)
-- keymap("t", "<M-2>", "<cmd>ToggleTerm direction=vertical size=50<cr>", opts)

keymap("n", "<M-3>", "<cmd>lua _FLOAT_TOGGLE()<cr>", opts)
keymap("t", "<M-3>", "<cmd>lua _FLOAT_TOGGLE()<cr>", opts)
-- keymap("n", "<M-3>", "<cmd>ToggleTerm direction=float<cr>", opts)
-- keymap("t", "<M-3>", "<cmd>ToggleTerm direction=float<cr>", opts)

--keymaps for tabs
-- keymap("n", "<M-l>", ":tabnext<CR>", opts)
-- keymap("n", "<M-h>", ":tabprevious<CR>", opts)
keymap("n", "<A-q>", ":tabclose<CR>", opts)
keymap("n", "<A-i>", ":tabnew<CR>", opts)

-- lsp keymap
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- keymap("n", "-", require("oil").open, { desc = "Open parent directory" })

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
