-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "helm_ls" })
-- local util = require("lspconfig.util")

-- local opts = {
-- 	cmd = { "helm_ls", "serve" },
-- 	filetypes = { "helm" },
-- 	root_dir = function(fname)
-- 		return util.root_pattern("Chart.yaml")(fname)
-- 	end,
-- }
-- require("lvim.lsp.manager").setup("helm_ls", opts)
--
-- local configs = require("lspconfig.configs")
-- local lspconfig = require("lspconfig")
-- local util = require("lspconfig.util")

-- if not configs.helm_ls then
-- 	configs.helm_ls = {
-- 		default_config = {
-- 			cmd = { "helm_ls", "serve" },
-- 			filetypes = { "helm" },
-- 			root_dir = function(fname)
-- 				return util.root_pattern("Chart.yaml")(fname)
-- 			end,
-- 		},
-- 	}
-- end

-- print("hello helms")

-- lspconfig.helm_ls.setup({
-- 	filetypes = { "helm" },
-- 	cmd = { "helm_ls", "serve" },
-- })
