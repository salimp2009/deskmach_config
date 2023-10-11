local configs = require("lspconfig.configs")
local nvim_lsp = require("lspconfig")
local on_attach = require("user.lsp.attach").on_attach

if not configs.neocmake then
	configs.neocmake = {
		default_config = {
			cmd = { "neocmakelsp", "--stdio" },
			filetypes = { "cmake" },
			root_dir = function(fname)
				return nvim_lsp.util.find_git_ancestor(fname)
			end,
			single_file_support = true, -- suggested
			on_attach = on_attach, -- on_attach is the on_attach function you defined
			init_options = {
				format = {
					enable = true,
				},
			},
		},
	}
	nvim_lsp.neocmake.setup({})
end
