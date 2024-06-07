-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "primer_dark"
-- lvim.colorscheme = "onedark"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- lvim.builtin.bigfile=false
vim.opt.relativenumber = true
vim.opt.iskeyword:append("-")
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
-- lvim.keys.normal_mode["<C-Left>"] = "<C-W> <"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymappin€ý.g
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.builtin.cmp.experimental.ghost_text = true
-- lvim.builtin.terminal.execs = {
-- 	{ nil, "<M-2>", "Horizontal Terminal", "horizontal", 0.3 },
-- 	{ nil, "<M-1>", "Vertical Terminal", "vertical", 0.4 },
-- 	{ nil, "<M-3>", "Float Terminal", "float", nil },
-- }

-- NOTE: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.autotag = true
lvim.builtin.dap.active = true
-- lvim.builtin.terminal.float_opts.highlights.border = "#4DBDCB"
lvim.builtin.bufferline.active = false
-- lvim.builtin.telescope.defaults.vimgrep_arguments = {
-- 	"rg",
-- 	"--color=never",
-- 	"--no-heading",
-- 	"--with-filename",
-- 	"--line-number",
-- 	"--column",
-- 	"--smart-case",
-- 	-- "--hidden",
-- 	"--glob=!.git/",
-- }

-- lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.telescope.defaults.layout_config = { width = 0.55, height = 0.95 }
-- lvim.builtin.telescope.extensions.fzf.fuzzy=true
lvim.builtin.telescope.theme = "center"
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<CR>", "Lsp References" }

lvim.lsp.buffer_mappings.normal_mode["gd"] = nil
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Lsp References" }

-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
