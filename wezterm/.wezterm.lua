-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font('FiraCode Nerd Font')
config.font_size = 21.0
config.colors = {
  foreground = '#959a96',
  background = '#151521',
  cursor_bg = '#707070',
  cursor_border = '#707070',
  selection_fg = '#1c1c2f',
  selection_bg = '#a0a0a0',

  ansi = {
    '#282a36',
    '#a35858',
    '#738e52',
    '#919062',
    '#5d879d',
    '#747897',
    '#6c9aa3',
    '#aaaaaa',
  },
  brights = {
    '#686868',
    '#a35858',
    '#738e52',
    '#919062',
    '#5d879d',
    '#747897',
    '#6c9aa3',
    '#aaaaaa',
  },
}
config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
