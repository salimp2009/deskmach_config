-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ansiblels"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- print(vim.api.nvim_buf_get_name(0))
-- local path = vim.api.nvim_buf_get_name(0)
-- local parts = vim.split(path, "/")
-- local filename = parts[#parts]
-- print(filename)
-- print(#parts)
-- -- check if ansidble is in file extension
-- if string.find(filename, "ansible") and (string.find(filename, "yaml") or string.find(filename, "yml")) then
-- 	require("lvim.lsp.manager").setup("ansiblels", {})
-- 	require("lvim.lsp.manager").setup("yamlls", {})
-- else
-- 	require("lvim.lsp.manager").setup("yamlls", {})
-- end
