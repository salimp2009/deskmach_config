vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "zls" })
require("lvim.lsp.manager").setup("zls", {
	on_attach = require("lvim.lsp").common_on_attach,
	capabilities = require("lvim.lsp").common_capabilities(),

	-- schema = "https://raw.githubusercontent.com/zigtools/zls/master/schema.json",
	-- -- edit to match zig compiler path
	-- zig_exe_path = "",--[[ "/home/xzhan/Development/Packages/software/zig/zig" ]]
	-- enable_snippets = true,
	-- enable_ast_check_diagnostics = true,
	-- enable_autofix = false,
	-- enable_import_embedfile_argument_completions = true,
	-- warn_style = true,
	-- enable_semantic_tokens = true,
	-- enable_inlay_hints = true,
	-- operator_completions = true,
	-- include_at_in_builtins = false,
	-- max_detail_length = 1048576,
})

-- zls.json setting either make zls.json at the root
-- or pass as opts into setup for zls lsp setup after the on attach
-- {
--     "$schema": "https://raw.githubusercontent.com/zigtools/zls/master/schema.json",
--     "zig_exe_path": "/home/xzhan/Development/Packages/software/zig/zig",
--     "enable_snippets": true,
--     "enable_ast_check_diagnostics": true,
--     "enable_autofix": false,
--     "enable_import_embedfile_argument_completions": true,
--     "warn_style": true,
--     "enable_semantic_tokens": true,
--     "enable_inlay_hints": true,
--     "operator_completions": true,
--     "include_at_in_builtins": false,
--     "max_detail_length": 1048576
-- }
