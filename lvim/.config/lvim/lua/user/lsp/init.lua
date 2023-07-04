---
require("user.lsp.languages.rust")
-- require("user.lsp.languages.rustlldb")
-- require "user.lsp.languages.go"
require("user.lsp.languages.python")
-- require("user.lsp.languages.js-ts")
-- require("user.lsp.languages.typescript")
-- require("user.lsp.languages.bash")
-- require("user.lsp.languages.emmet")
-- require("user.lsp.languages.cpp")

-- require("user.lsp.languages.cpplldb")
require("user.lsp.languages.cppgdb")
vim.diagnostic.config({ virtual_text = false })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "java",
-- }

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- local formatters = require("lvim.lsp.null-ls.formatters")
-- formatters.setup({
-- { command = "google_java_format", filetypes = { "java" } },
-- { command = "stylua", filetypes = { "lua" } },
-- { command = "shfmt", filetypes = { "sh", "zsh" } },
-- { command = "prettier", filetypes = { "css" } },
-- })

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }
