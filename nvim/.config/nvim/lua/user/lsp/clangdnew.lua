-- Clangd
if vim.fn.executable("clangd") == 1 then
	require("lspconfig").clangd.setup({
		on_attach = require("user.lsp.attach").on_attach,
		capabilities = require("user.lsp.attach").capabilities,
		cmd = {
			"clangd",
			"--background-index",
			"--fallback-style=Google",
			"--all-scopes-completion",
			"--clang-tidy",
			"--log=error",
			"--completion-style=detailed",
			"--pch-storage=memory",
			"--enable-config",
			"--offset-encoding=utf-16",
			"--limit-references=1000",
			"--malloc-trim",
			"--header-insertion=never",
			"--query-driver=/usr/bin/arm-none-eabi-gcc,/usr/bin/arm-none-eabi-g++",
		},
		settings = {
			clangd = {
				InlayHints = {
					Designators = true,
					Enabled = true,
					ParameterNames = true,
					DeducedTypes = true,
				},
				fallbackFlags = { "-std=c++20" },
			},
		},
	})

	local clangd_cap = require("user.lsp.attach").capabilities
	clangd_cap.offsetEncoding = { "utf-16" }

	require("clangd_extensions").setup({
		ast = {
			-- These require codicons (https://github.com/microsoft/vscode-codicons)
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
			},

			highlights = {
				detail = "Comment",
			},
		},
		memory_usage = {
			border = "none",
		},
		symbol_info = {
			border = "none",
		},
	})
else
	print("lspconfig: clangd not found")
end
