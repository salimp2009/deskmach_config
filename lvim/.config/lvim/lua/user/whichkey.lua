lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }

lvim.builtin.which_key.mappings["a"] = {
	name = "A.I.",
	-- c = { "<cmd>Codeium Enable<cr>", "Codeium Enable" },
	-- d = { "<cmd>Codeium Disable<cr>", "Codeium Disable" },
}

-- local m_opts = {
-- 	mode = "n", -- NORMAL mode
-- 	prefix = "m",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }

-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
-- 	return
-- end

-- local m_mappings = {
-- 	y = { "<cmd>BookmarkCreate<cr>", "Toggle" },
-- 	j = { "<cmd>BookmarkNext<c>", "Next" },
-- 	k = { "<cmd>BookmarkPrev<cr>", "Prev" },
-- 	x = { "<cmd>BookmarkClear<cr>", "Clear" },
-- 	z = { "<cmd>BookmarkList<cr>", "List" },
-- 	t = { "<cmd>FilemarkToggle<cr>", "Mark File" },
-- 	m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
-- 	["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
-- 	[","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
-- 	-- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
-- 	-- s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
-- 	-- s = {
-- 	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
-- 	--   "Show",
-- 	-- },
-- 	-- [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
-- }

-- which_key.register(m_mappings, m_opts)

lvim.builtin.which_key.mappings["B"] = {
	name = "BookMarks",
	c = { "<cmd>BookmarkCreate<cr>", "Create" },
	j = { "<cmd>BookmarkNext<c>", "Next" },
	k = { "<cmd>BookmarkPrev<cr>", "Prev" },
	x = { "<cmd>BookmarkClear<cr>", "Clear" },
	z = { "<cmd>BookmarkList<cr>", "List" },
	t = { "<cmd>FilemarkToggle<cr>", "Mark File" },
	m = { "<cmd>BookmarkToggle<cr>", "List" },

	-- m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	-- n = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
	-- p = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
	s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
}
