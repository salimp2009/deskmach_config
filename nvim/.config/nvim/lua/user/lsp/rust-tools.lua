if vim.fn.executable("rust-analyzer") == 1 then
	require("rust-tools").setup({
		server = {
			on_attach = function(client, bufnr)
				require("user.lsp.attach").on_attach(client, bufnr)
				local rt = require("rust-tools")
				vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
			end,
			capabilities = require("user.lsp.attach").capabilities,
			settings = {
				["rust-analyzer"] = {
					lens = {
						enable = true,
					},
					checkOnSave = {
						enable = true,
						command = "clippy",
					},
					diagnostics = {
						enable = true,
					},
					-- event = "BufReadPost",
				},
			},
		},
		tools = {
			executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
			reload_workspace_from_cargo_toml = true,
			runnables = {
				use_telescope = true,
			},
			inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = false,
				parameter_hints_prefix = "<-",
				other_hints_prefix = "=>",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},
			hover_actions = {
				border = "rounded",
			},
			on_initialized = function()
				vim.api.nvim_create_autocmd({
					"BufAdd",
					"BufWritePost",
					"BufEnter",
					"CursorHold",
					"InsertLeave",
				}, {
					pattern = { "*.rs" },
					callback = function()
						local _, _ = pcall(vim.lsp.codelens.refresh)
					end,
				})
			end,
		},
	})
else
	print("lspconfig: rust-analyzer not found")
end
