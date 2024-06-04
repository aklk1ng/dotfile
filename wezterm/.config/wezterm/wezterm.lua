local wezterm = require('wezterm')
return {
  front_end = 'WebGpu',
  enable_wayland = true,
  font = wezterm.font_with_fallback({
    'FiraCode Nerd Font',
    'Noto Sans CJK SC',
    'Symbols Nerd Font',
  }),
  font_size = 21,
  use_cap_height_to_scale_fallback_fonts = true,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  underline_position = -7,
  underline_thickness = 2.5,
  window_background_opacity = 1.0,
  line_height = 1.1,
  window_frame = {
    inactive_titlebar_bg = '#1a1b21',
    active_titlebar_bg = '#1a1b21',
  },
  colors = {
    foreground = '#959a96',
    background = '#1a1b21',
    cursor_bg = '#707070',
    cursor_fg = '#1a1b21',
    cursor_border = '#707070',
    selection_fg = '#1c1c2f',
    selection_bg = '#a0a0a0',
    scrollbar_thumb = '#222222',
    split = '#444444',

    ansi = {
      '#282a36',
      '#a35858',
      '#738e52',
      '#919062',
      '#51809a',
      '#747897',
      '#6c9aa3',
      '#aaaaaa',
    },
    brights = {
      '#686868',
      '#a35858',
      '#738e52',
      '#919062',
      '#51809a',
      '#747897',
      '#6c9aa3',
      '#aaaaaa',
    },

    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = '#1a1b21',
      active_tab = {
        bg_color = '#1a1b21',
        fg_color = '#757575',
      },
      inactive_tab = {
        bg_color = '#1a1b21',
        fg_color = '#6b6a6b',
      },
    },
  },
}
