local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- load lazy
require("lazy").setup("user.plugins", {
	git = {
		log = { "--since=3 days ago" }, -- show commits from the last 3 days
		timeout = 600,
	},
	defaults = { lazy = false },
	install = { colorscheme = { "tokyo-night" } },
	-- ui = {
	--    border = "rounded",
	--    wrap = "true"
	--  },
	-- change_detection = { enabled = true },
	-- debug = false,
	performance = {
		rtp = {
			paths = {
				vim.fn.expand("~") .. "/.config/nvim",
			},
			disabled_plugins = {
				"loaded_python3_provider",
				"python_provider",
				"node_provider",
				"ruby_provider",
				"perl_provider",
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"tar",
				"tarPlugin",
				"rrhelper",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"logiPat",
				"netrwSettings",
				"netrwFileHandlers",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
				"load_ftplugin",
				"indent_on",
				"netrwPlugin",
				"tohtml",
				"man",
				"matchit",
				"editorconfig",
				"matchparen",
			},
		},
	},
})
