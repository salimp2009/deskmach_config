-- Clangd
if vim.fn.executable("clangd") == 1 then
	local clangd_defaults = require("lspconfig.server_configurations.clangd")
	local clangd_configs = vim.tbl_deep_extend("force", clangd_defaults["default_config"], {
		cmd = {
			"clangd",
			-- NOTE: don't remove this if you don't want errors
			"--offset-encoding=utf-16",
			"-j=4",
			"--background-index",
			"--clang-tidy",
			"--fallback-style=llvm",
			"--all-scopes-completion",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
			"--header-insertion-decorators",
			"--pch-storage=memory",
			"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
			"--suggest-missing-includes",
			"--cross-file-rename",
			"--query-driver=/usr/bin/arm-none-eabi-gcc,/usr/bin/arm-none-eabi-g++",
		},
	})

	local clangd_cap = require("user.lsp.attach").capabilities
	clangd_cap.offsetEncoding = { "utf-16" }

	require("clangd_extensions").setup({
		server = {
			clangd_configs,
			on_attach = require("user.lsp.attach").on_attach,
			capabilities = clangd_cap,
		},
		extensions = {
			autoSetHints = true,
			hover_with_actions = true,
			inlay_hints = {
				only_current_line = false,
				only_current_line_autocmd = "CursorHold",
				show_parameter_hints = true,
				parameter_hints_prefix = "<- ",
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
				priority = 100,
			},
			ast = {
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
					ExprWithCleanups = "",
					CXXConstruct = "",
				},

				highlights = {
					detail = "Comment",
				},
				memory_usage = {
					border = "rounded",
				},
				symbol_info = {
					border = "rounded",
				},
			},
		},
	})
else
	print("lspconfig: clangd not found")
end
