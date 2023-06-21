local lspconfig = require("lspconfig")
local on_attach = require("user.lsp.attach").on_attach

local capabilities = require("user.lsp.attach").capabilities


-- nvim-basic-ide code
for _, server in pairs(require("utils").servers) do
	Opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "settings." .. server)
	if require_ok then
		Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
	end

	lspconfig[server].setup(Opts)
end

