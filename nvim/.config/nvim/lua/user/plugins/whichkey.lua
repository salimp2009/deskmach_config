local M = {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
}

function M.config()
	local which_key = require("which-key")
	local setup = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "j", "k" },
			v = { "j", "k" },
		},
	}

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
		["b"] = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		["D"] = { "<cmd>Telescope file_browser<cr>", "File browser" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["w"] = { "<cmd>w!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },
		["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
		-- ["m"] = { "<cmd>lua _MOCP_TOGGLE()<CR>", "MOCP" },
		["j"] = { "<cmd>Jaq<CR>", "Jaq" },
		["h"] = { "<cmd>nohlsearch<cr>", "nohl" },
		["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
		["f"] = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))<cr>",
			"Find files",
		},
		["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
		["p"] = {
			"<cmd>lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown{previewer = false, initial_mode = normal})<cr>",
			"Projects",
		},
		["S"] = { "<cmd>source %<cr>", "Source file" },
		L = {
			name = "Lazy",
			s = { "<cmd>Lazy update<cr>", "Update" },
			l = { "<cmd>Lazy log<cr>", "Log" },
			p = { "<cmd>Lazy profile<cr>", "Profile" },
			d = { "<cmd>Lazy debug<cr>", "Debug" },
			c = { "<cmd>Lazy clean<cr>", "Clean" },
			S = { "<cmd>Lazy<cr>", "Lazy" },
		},
		["r"] = { "<cmd>:Telescope oldfiles<cr>", "Recent Files" },
		g = {
			name = "Git",
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Diff",
			},
		},
		d = {
			name = "Debug",
			b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
			s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
			O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
			l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
			u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
			x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
		},
		["M"] = { "<cmd>MarkdownPreview<cr>", "Markdown preview" },
		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			-- Uncomment when nvim-conform and nvim-lint is enable instead of none-ls
			-- f = {
			--   function()
			--     local function myCallback(err)
			--       if err then
			--         vim.notify("Error during formatting: ", err)
			--       else
			--         vim.notify("Formatting completed successfully.")
			--       end
			--     end
			--     require("conform").format({
			--       lsp_fallback = true,
			--       async = false,
			--       timeout_ms = 1000,
			--     }, myCallback())
			--   end,
			--   "Format",
			-- },
			-- F = { "<cmd>FormatToggle<cr>", "Toggle Autoformat" },

			-- Delete when the above alternative are enabled
			f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
			F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>Mason<cr>", "Installer Info" },
			j = {
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				"Next Diagnostic",
			},
			k = {
				"<cmd>lua vim.diagnostic.goto_prev()<cr>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current buffer" },
			s = { "<cmd>lua require('luasnip.loaders').edit_snippet_files()<cr>", "Edit Snippets" },
		},
		T = {
			name = "Treesitter",
			i = { "<cmd>TSInstallInfo<cr>", "Install info" },
			u = { "<cmd>TSUpdate<cr>", "Update" },
			s = { "<cmd>TSUpdateSync<cr>", "Update and sync" },
			e = { "<cmd>TSEnable<cr>", "Enable" },
			d = { "<cmd>TSDisable<cr>", "Disable" },
		},
		t = {
			name = "Terminal",
			n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
			u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
			H = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
			p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
			t = { "<cmd>ToggleTerm<cr>", "toggle" },
			T = { "<cmd>terminal<cr>", "Neoterminal" },
		},
		n = {
			name = "Notes Markdown",
			f = { "<cmd>Telescope find_files search_dirs=~/Documents/notes/<cr>", "Find Notes" },
			n = { "<cmd>Telescope live_grep search_dirs=~/Documents/notes/<cr>", "Live Grep Notes" },
		},
		-- C = {
		-- 	name = "Cmp",
		--			c = { "<cmd>Copilot<cr>", "Copilot" },
		--			e = { "<cmd>let g:cmp_toggle = v:true<cr>", "Enable" },
		--			d = { "<cmd>let g:cmp_toggle = v:false<cr>", "Disable" },
		--			g = { '<cmd>NeoAI<cr>', "ChatGpt" },
		-- },
		-- ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
	}

	which_key.setup(setup)
	which_key.register(mappings, opts)
end

return M
