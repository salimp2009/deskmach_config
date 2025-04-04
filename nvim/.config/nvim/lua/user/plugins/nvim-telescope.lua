local M = {
	"ahmedkhalf/project.nvim",
	commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			cmd = { "Telescope" },
			lazy = true,
			dependencies = {
				{
					"nvim-telescope/telescope-file-browser.nvim",
					cmd = "Telescope file_browser",
					lazy = true,
				},
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
					lazy = true,
				},
			},
		},
	},
}

function M.config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local icons = require("user.icons")
	telescope.load_extension("file_browser")
	telescope.load_extension("fzf")

	-- local previewers = require("telescope.previewers")
	-- local sorters = require("telescope.sorters")
	--
	-- local file_previewer = previewers.vim_buffer_cat.new
	-- local grep_previewer = previewers.vim_buffer_vimgrep.new
	-- local qflist_previewer = previewers.vim_buffer_qflist.new
	-- local file_sorter = sorters.get_fuzzy_file
	-- local generic_sorter = sorters.get_generic_fuzzy_sorter

	require("project_nvim").setup({
		---@usage set to false to disable project.nvim.
		--- This is on by default since it's currently the expected behavior.
		active = true,
		on_config_done = nil,
		---@usage set to true to disable setting the current-woriking directory
		--- Manual mode doesn't automatically change your root directory, so you have
		--- the option to manually do so using `:ProjectRoot` command.
		manual_mode = false,
		---@usage Methods of detecting the root directory
		--- Allowed values: **"lsp"** uses the native neovim lsp
		--- **"pattern"** uses vim-rooter like glob pattern matching. Here
		--- order matters: if one is not detected, the other is used as fallback. You
		--- can also delete or rearangne the detection methods.
		-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
		detection_methods = { "pattern" },
		---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
		patterns = { "lazy-lock.json", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "LICENSE" },
		---@ Show hidden files in telescope when searching for files in a project
		show_hidden = true,
		---@usage When set to false, you will get a message when project.nvim changes your directory.
		-- When set to false, you will get a message when project.nvim changes your directory.
		silent_chdir = true,
		---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
		ignore_lsp = {},
		---@type string
		---@usage path to store the project history for use in telescope
		datapath = vim.fn.stdpath("data"),
	})

	require("telescope").load_extension("projects")

	telescope.setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = " ",
			path_display = { "smart" },
			selection_strategy = "reset",
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" },
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			file_ignore_patterns = {
				".git/",
				"target/",
				"docs/",
				"vendor/*",
				"%.lock",
				"__pycache__/*",
				"%.sqlite3",
				"%.ipynb",
				-- "node_modules/*",
				"%.jpg",
				"%.jpeg",
				"%.png",
				"%.svg",
				"%.otf",
				"%.ttf",
				"%.webp",
				".dart_tool/",
				".github/",
				".gradle/",
				".idea/",
				"%.settings/",
				".vscode/",
				"__pycache__/",
				-- "build/",
				"env/",
				"gradle/",
				-- "node_modules/",
				"%.pdb",
				"%.dll",
				"%.class",
				"%.exe",
				"%.cache",
				"%.ico",
				"%.pdf",
				"%.dylib",
				"%.jar",
				"%.docx",
				"%.met",
				"smalljre_*/*",
				".vale/",
				"%.burp",
				"%.mp4",
				"%.mkv",
				"%.rar",
				"%.zip",
				"%.7z",
				"%.tar",
				"%.bz2",
				"%.epub",
				"%.flac",
				"%.tar.gz",
			},
			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-b>"] = actions.results_scrolling_up,
					["<C-f>"] = actions.results_scrolling_down,
					["<C-c>"] = actions.close,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["<CR>"] = actions.select_default,
					["<C-s>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,
					["<c-d>"] = actions.delete_buffer,
					-- ["<C-u>"] = actions.preview_scrolling_up,
					-- ["<C-d>"] = actions.preview_scrolling_down,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					-- ["<Tab>"] = actions.close,
					-- ["<S-Tab>"] = actions.close,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
					["<esc>"] = actions.close,
				},
				n = {
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,
					["<C-b>"] = actions.results_scrolling_up,
					["<C-f>"] = actions.results_scrolling_down,
					["<Tab>"] = actions.close,
					["<S-Tab>"] = actions.close,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,
					["q"] = actions.close,
					["dd"] = actions.delete_buffer,
					["s"] = actions.select_horizontal,
					["v"] = actions.select_vertical,
					["t"] = actions.select_tab,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,
					["?"] = actions.which_key,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
				only_sort_text = true,
			},
			grep_string = {
				theme = "dropdown",
				only_sort_text = true,
			},
			find_files = {
				-- layout_strategy = "horizontal",
				-- layout_config = {
				-- 	horizontal = {
				-- 		prompt_position = "top",
				-- 		preview_width = 0.55,
				-- 	},
				-- 	vertical = {
				-- 		mirror = false,
				-- 	},
				-- 	width = 0.87,
				-- 	height = 0.80,
				-- 	preview_cutoff = 120,
				-- },
				theme = "dropdown",
				-- layout_strategy = "horizontal",
				-- layout_config = { width = 0.95 },
				-- previewer = true,
				previewer = false,
				hidden = true,
			},
			planets = {
				show_pluto = true,
				show_moon = true,
			},
			colorscheme = {
				-- enable_preview = true,
			},
			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			initial_mode = "normal",
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		},
		extensions = {
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
				opts = {
					hidden = true,
				},
			},
			-- man_pages = {
			-- 	sections = { "ALL" },
			-- },
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	})
end

return M
