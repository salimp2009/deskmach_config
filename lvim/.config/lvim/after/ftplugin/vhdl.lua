vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "vhdl_ls" })
require("lvim.lsp.manager").setup("vhdl_ls", {})
