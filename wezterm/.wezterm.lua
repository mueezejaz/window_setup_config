-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- Create the configuration object
local config = wezterm.config_builder()

-- General settings
config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

-- Font settings
config.font_size = 13.0
config.cell_width = 0.9

-- Window appearance
config.window_background_opacity = 0.9
config.prefer_egl = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Window frame
config.window_frame = {
	active_titlebar_bg = "#1a1b26", -- Tokyo Night dark background
}
config.window_decorations = "NONE | RESIZE"

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Default program
config.default_prog = { "pwsh.exe", "-NoLogo" }
config.initial_cols = 80

-- Colors
config.color_scheme = "Tokyo Night"

-- Optional: tweak cursor to match Tokyo Night theme
config.colors = {
	cursor_border = "#7aa2f7",
	cursor_bg = "#7aa2f7",
	tab_bar = {
		background = "#1a1b26",
		active_tab = {
			bg_color = "#1a1b26",
			fg_color = "#7aa2f7",
			intensity = "Normal",
		},
		inactive_tab = {
			bg_color = "#1a1b26",
			fg_color = "#c0caf5",
			intensity = "Normal",
		},
		new_tab = { bg_color = "#1a1b26", fg_color = "#c0caf5" },
	},
}

-- Keybindings
config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.EmitEvent("toggle-colorscheme"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- Toggle between Tokyo Night and Zenburn
wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}

	if overrides.color_scheme == "Zenburn" then
		overrides.color_scheme = "Tokyo Night"
	else
		overrides.color_scheme = "Zenburn"
	end

	window:set_config_overrides(overrides)
end)

-- Return the config to wezterm
return config