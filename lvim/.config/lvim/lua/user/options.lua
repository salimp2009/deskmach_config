-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "onedark"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.relativenumber = true
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
-- lvim.keys.normal_mode["<C-Left>"] = "<C-W> <"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- NOTE: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.autotag = true
lvim.builtin.dap.active = true
-- lvim.builtin.bufferline.active = false
-- lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.telescope.defaults.layout_config = { width = 0.55, height = 0.95 }
lvim.builtin.telescope.theme = "center"
-- lvim.builtin.telescope.pickers.find_files = {
-- 	hidden = true,
-- 	follow = true,
-- }
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
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

-- lvim.builtin.treesitter.rainbow.enable = true

if lvim.colorscheme == "darkplus" then
	lvim.builtin.treesitter.rainbow = {
		enable = true,
		extended_mode = false,
		colors = {
			"DodgerBlue",
			"Orchid",
			"Gold",
		},
		disable = { "html" },
	}
else
	lvim.builtin.treesitter.rainbow = {
		enable = true,
		extended_mode = false,
		disable = { "html" },
	}
end
