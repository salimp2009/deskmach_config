local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	lazy = true,
	-- commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")
	-- local icons = require("user.iconsnew")

	local function button(sc, txt, keybind, keybind_opts)
		local b = dashboard.button(sc, txt, keybind, keybind_opts)
		b.opts.hl_shortcut = "Macro"
		return b
	end

	dashboard.section.header.val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}

	dashboard.section.header.val = {
		[[🛸　　　 　🌎　°　　🌓　•　　.°•　　　🚀 ✯       ]],
		[[　　　★　*　　　　　°　　　　🛰 　°·      🪐     ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		[[.　　　•　° ★　•  ☄                              ]],
		[[                 ▁▂▃▄▅▆▇▇▆▅▄▃▂▁.                 ]],
	}
	--
	-- dashboard.section.header.val = {
	-- 	[[ ★　✯   🛸                    🪐   .°•    |    ]],
	-- 	[[    __     ° ★　•       🛰       __      / \   ]],
	-- 	[[   / /   ____ ___  ______  _____/ /_    | O |  ]],
	-- 	[[  / /   / __ `/ / / / __ \/ ___/ __ \   | O |  ]],
	-- 	[[ / /___/ /_/ / /_/ / / / / /__/ / / /  /| | |\ ]],
	-- 	[[/_____/\__,_/\__,_/_/ /_/\___/_/ /_/  /_(.|.)_\]],
	-- }

	dashboard.section.buttons.val = {
		button("f", " " .. " Find file", ":Telescope find_files <CR>"),
		button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
		button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
		button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
		button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
		button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", " " .. " Quit", ":qa<CR>"),
	}
	local function footer()
		return "https://github.com/salimp2009"
	end

	dashboard.section.footer.val = footer()

	dashboard.section.header.opts.hl = "String"
	dashboard.section.buttons.opts.hl = "Macro"
	dashboard.section.footer.opts.hl = "Type"

	dashboard.opts.opts.noautocmd = true
	require("alpha").setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function()
			vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
		end,
	})
end

return M
