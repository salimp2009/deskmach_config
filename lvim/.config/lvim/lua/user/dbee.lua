local config = {
	lazy = false,
	connections = {
		{
			name = "test_db",
			type = "sqlite",
			url = "/home/salim/.config/lvim/test_db",
		},
	},
	-- extra_helpers = {
	--   ["sqlite"] = {
	--     ["List All"] = "select * from {table}",
	--   },
	-- },
}

require("dbee").setup(config)
