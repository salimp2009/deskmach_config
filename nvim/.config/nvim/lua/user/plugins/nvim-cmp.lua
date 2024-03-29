local M = {
	"hrsh7th/nvim-cmp",
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		{
			"L3MON4D3/LuaSnip",
		},
		{
			"rafamadriz/friendly-snippets",
		},
		{
			"tzachar/cmp-tabnine",
			event = "InsertEnter",
			build = "./install.sh",
		},
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	require("luasnip.loaders.from_vscode").lazy_load()

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	-- 󰃐 󰆩 󰙅 󰛡  󰅲 some other gogin for getting the float window for hovers etcod icons
	local kind_icons = {
		Text = "󰉿",
		Method = "",
		Function = "󰊕",
		Constructor = "",
		Field = "",
		Variable = "󰆧",
		Class = "󰌗",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰇽",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		Package = "",
		TypeParameter = "󰊄",
		TabNine = "󰚩",
		-- Codeium = "󰚩",
		Copilot = "",
	}
	-- find more here: https://www.nerdfonts.com/cheat-sheet
	cmp.setup({
		enabled = function()
			local buftype = vim.api.nvim_buf_get_option(0, "buftype")
			if buftype == "prompt" then
				return false
			end
			return vim.g.cmp_toggle
		end,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		sorting = {
			comparators = {
				cmp.config.compare.exact,
				-- copilot_cmp.prioritize,
				-- copilot_cmp.score,
				require("clangd_extensions.cmp_scores"),
			},
		},
		mapping = {
			--my-keymappings
			["<Up>"] = cmp.mapping.select_prev_item(),
			["<Down>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				-- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- vim.api.nvim_set_hl(0, "CmpItemKindTabNine", {fg ="#6CC644"})

				if entry.source.name == "copilot" then
					vim_item.kind_hl_group = "CmpItemKindCopilot"
				end

				if entry.source.name == "cmp_tabnine" then
					vim_item.kind_hl_group = "CmpItemKindTabnine"
				end

				if entry.source.name == "crates" then
					vim_item.kind = kind_icons.Package
					vim_item.kind_hl_group = "CmpItemKindCrate"
				end

				if entry.source.name == "lab.quick_data" then
					vim_item.kind_hl_group = "CmpItemKindConstant"
				end

				if entry.source.name == "emoji" then
					vim_item.kind_hl_group = "CmpItemKindEmoji"
				end

				-- Added those to autocommands; it seems to be working
				vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
				vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
				vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
				vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

				vim_item.kind = kind_icons[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					nvim_lua = "[NVLUA]",
					luasnip = "[SNPT]",
					buffer = "[BFR]",
					path = "[PATH]",
					cmp_tabnine = "[TBNI]",
					codeium = "[CDEM]",
					copilot = "[CPLT]",
					crates = "[CRAT]",
					emoji = "[EMOJ]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "cmp_tabnine" },
			{ name = "copilot" },
			{ name = "codeium" },
			{ name = "crates" },
			{ name = "emoji" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		},
		experimental = {
			native_menu = false,
			-- ghost_text = true,
		},
	})
end

return M
