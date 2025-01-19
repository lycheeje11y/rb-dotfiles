-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
config.color_scheme = "Jellybeans"

config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.5
config.macos_window_background_blur = 5

-- and finally, return the configuration to wezterm
return config
