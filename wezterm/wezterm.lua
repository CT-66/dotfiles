local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'Atom'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'One Dark (Gogh)'

config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font = wezterm.font 'FiraCode Nerd Font'

local act = wezterm.action

config.keys = {
  { key = 'u', mods = 'ALT', action = act.ScrollByPage(-1) },
  { key = 'd', mods = 'ALT', action = act.ScrollByPage(1) },
}


return config
