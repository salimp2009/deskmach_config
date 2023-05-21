local wezterm = require("wezterm")
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local fonts = {
	"Cascadia Code",
	"JetBrainsMono Nerd Font Mono",
	"FiraCode Nerd Font",
	"Inconsolota",
	"Victor Mono",
}
-- why is this not working :( ==  ==> <=>  =>
local emoji_fonts = { "Apple Color Emoji", "Joypixels", "Noto emoji" }
config.harfbuzz_features = { "calt", "liga", "zero", "ss01", "-ss04" }

config.font = wezterm.font_with_fallback({ fonts[1], emoji_fonts[1], emoji_fonts[3] })

config.enable_scroll_bar = false
config.scrollback_lines = 10240
config.warn_about_missing_glyphs = false
config.font_size = 13
-- config.bold_brightens_ansi_colors = true
-- config.color_scheme = "Decaf (base16)"
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "NONE"
config.initial_cols = 80
config.initial_rows = 25
config.enable_wayland = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.automatically_reload_config = true
-- config.window_background_opacity = 1.0
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 10,
	right = 10,
	top = 0,
	bottom = 0,
}
config.color_scheme = "tokyonight_night"
config.colors = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.enable_kitty_graphics = true
config.default_prog = { "zsh" }
-- config.colors = {
-- 	background = "#585B70",
-- 	foreground = "#CDD6F4",
-- 	tab_bar = {
-- 		background = "#282a36",
-- 		inactive_tab = {
-- 			bg_color = "#282a36",
-- 			fg_color = "#6272a4",
-- 		},
-- 		active_tab = {
-- 			bg_color = "#282a36",
-- 			fg_color = "#f8f8f2",
-- 		},
-- 		new_tab = {
-- 			bg_color = "#282a36",
-- 			fg_color = "#f8f8f2",
-- 		},
-- 		new_tab_hover = {
-- 			bg_color = "#282a36",
-- 			fg_color = "#f8f8f2",
-- 		},
-- 	},

-- 	ansi = {
-- 		"#282936",
-- 		"#ea51b2",
-- 		"#00f769",
-- 		"#ebff87",
-- 		"#62d6e8",
-- 		"#b45bcf",
-- 		"#a1efe4",
-- 		"#e9e9f4",
-- 	},

-- 	brights = {
-- 		"#4d4f68",
-- 		"#ea51b2",
-- 		"#00f769",
-- 		"#ebff87",
-- 		"#62d6e8",
-- 		"#b45bcf",
-- 		"#a1efe4",
-- 		"#f7f7fb",
-- 	},
-- }

-- config.color_schemes = {
-- 	["Dracula custom"] = config.colors,
-- }

-- config.color_scheme = "Dracula custom"

local action = wezterm.action
config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = action({ PasteFrom = "Clipboard" }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = action({ ActivateTabRelative = 1 }),
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = action.ReloadConfiguration,
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = action.QuitApplication,
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = action({ SpawnTab = "CurrentPaneDomain" }),
	},
	-- {
	--   key = "n",
	--   mods = "CTRL",
	--   action = action(SpawnCommand = "navi"),
	-- },
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = action.SpawnWindow,
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = action({ CloseCurrentTab = { confirm = true } }),
	},
	{
		key = "1",
		mods = "CTRL",
		action = action({ ActivateTab = 0 }),
	},
	{
		key = "2",
		mods = "CTRL",
		action = action({ ActivateTab = 1 }),
	},
	{
		key = "3",
		mods = "CTRL",
		action = action({ ActivateTab = 2 }),
	},
	{
		key = "4",
		mods = "CTRL",
		action = action({ ActivateTab = 3 }),
	},
	{
		key = "5",
		mods = "CTRL",
		action = action({ ActivateTab = 4 }),
	},
	{
		key = "6",
		mods = "CTRL",
		action = action({ ActivateTab = 5 }),
	},
	{
		key = "7",
		mods = "CTRL",
		action = action({ ActivateTab = 6 }),
	},
	{
		key = "8",
		mods = "CTRL",
		action = action({ ActivateTab = 7 }),
	},
	{
		key = "9",
		mods = "CTRL",
		action = action({ ActivateTab = 8 }),
	},
	{
		key = "0",
		mods = "CTRL",
		action = action({ ActivateTab = 9 }),
	},
	{
		key = "Enter",
		mods = "CTRL",
		action = action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
}

return config
