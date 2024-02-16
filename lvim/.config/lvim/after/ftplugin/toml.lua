-- require("lvim.lsp.manager").setup("taplo")

local path = vim.api.nvim_buf_get_name(0)
local parts = vim.split(path, "/")
local filename = parts[#parts]

if string.find(filename, "Cargo.toml") then
	print(filename)

	require("crates").setup({
		src = {
			cmp = {
				enabled = true,
				use_custom_kind = true,
				kind_text = {
					version = "Version",
					feature = "Feature",
				},
				kind_highlight = {
					version = "CmpItemKindVersion",
					feature = "CmpItemKindFeature",
				},
			},
		},
		null_ls = {
			enabled = true,
			name = "crates.nvim",
		},
		lsp = {
			enabled = true,
			name = "crates.nvim",
			on_attach = function(client, bufnr)
				require("lvim.lsp").common_on_attach(client, bufnr)
			end,
			actions = true,
			completion = true,
			hover = true,
		},
		popup = {
			border = "rounded",
		},

		-- null_ls = {
		-- 	enabled = true,
		-- 	name = "crates.nvim",
		-- },
		-- popup = {
		-- 	border = "rounded",
		-- },
	})
end
