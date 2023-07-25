require("noice").setup({
	lsp = {
		signature = {
			enabled = false,
		},
		hover = {
			enabled = false,
		},
		progress = {
			enabled = false,
		},
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			-- ["cmp.entry.get_documentation"] = true,
		},
		message = {
			-- Messages shown by lsp servers
			enabled = false,
			-- view = "notify",
			-- opts = {},
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},

	cmdline = {
		enabled = true, -- enables the Noice cmdline UI
		view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		opts = {}, -- global options for the cmdline. See section on views
		---@type table<string, CmdlineFormat>
		format = {
			-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			-- view: (default is cmdline view)
			-- opts: any options passed to the view
			-- icon_hl_group: optional hl_group for the icon
			-- title: set to anything or empty string to hide
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			input = {}, -- Used by input()
			-- lua = false, -- to disable a format, set to `false`
		},
	},

	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = false, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
		---@type 'nui'|'cmp'
		backend = "nui", -- backend to use to show regular cmdline completions
		---@type NoicePopupmenuItemKind|false
		-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
		kind_icons = {}, -- set to `false` to disable icons
	},

	routes = {
		{
			view = "mini",
			filter = { event = "msg_showmode" },
		},
		{
			filter = {
				event = "msg_show",
				find = "%d+L, %d+B",
			},
			view = "mini",
		},
		{
			view = "cmdline_output",
			filter = { cmdline = "^:", min_height = 5 },
			-- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
		},
		{
			filter = { event = "msg_show", kind = "search_count" },
			opts = { skip = true },
		},
		{
			filter = {
				event = "msg_show",
				find = "; before #",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = "msg_show",
				find = "; after #",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = "msg_show",
				find = " lines, ",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = "msg_show",
				find = "go up one level",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = "msg_show",
				find = "yanked",
			},
			opts = { skip = true },
		},
		{
			filter = { find = "No active Snippet" },
			opts = { skip = true },
		},
		{
			filter = { find = "waiting for cargo metadata" },
			opts = { skip = true },
		},
	},
    -- stylua: ignore
  keys = {
    {
      "<S-Enter>",
      function() require("noice").redirect(vim.fn.getcmdline()) end,
      mode = "c",
      desc =
      "Redirect Cmdline"
    },
    {
      "<leader>snl",
      function() require("noice").cmd("last") end,
      desc =
      "Noice Last Message"
    },
    {
      "<leader>snh",
      function() require("noice").cmd("history") end,
      desc =
      "Noice History"
    },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    {
      "<c-f>",
      function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
      silent = true,
      expr = true,
      desc =
      "Scroll forward"
    },
    {
      "<c-b>",
      function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
      silent = true,
      expr = true,
      desc =
      "Scroll backward"
    },
  },
})
